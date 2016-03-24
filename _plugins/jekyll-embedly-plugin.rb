require "net/https"
require "uri"
require "json"
require "domainatrix"
require "compose_url"

module JekyllEmbedlyPlugin

  class FileCache
    def initialize
      @cache_folder   = File.expand_path(".embedly-cache")
      FileUtils.mkdir_p @cache_folder
    end

    def read(key)
      file_to_read = cache_file(cache_filename(key))
      File.read(file_to_read) if File.exist?(file_to_read)
    end

    def write(key, response)
      file_to_write = cache_file(cache_filename(key))

      File.open(file_to_write, 'w') do |f|
        f.write(response)
      end
    end

    private

    def cache_file(filename)
      File.join(@cache_folder, filename)
    end

    def cache_filename(cache_key)
      "#{cache_key}.cache"
    end
  end

  class NullCache
    def read(_key); end

    def write(_key, _data); end
  end

  module Cacheable
    def cache_key(url)
      Digest::MD5.hexdigest("#{url}")
    end
  end

  class EmbedlyTag < Liquid::Tag
    include JekyllEmbedlyPlugin::Cacheable

    def initialize(tag_name, text, tokens)
      super

      tokens      = text.split /\,\s/
      @url        = tokens[0]
      @parameters = {}
      @cache      = FileCache.new

      tokens[1..-1].each do |arg|
        key, value = arg.split /:/
        value ||= "1"
        @parameters[key.strip] = value.strip
      end
    end

    def render(context)
      @config  = context.registers[:site].config["embedly"]
      @api_key = @config["api_key"]

      if @api_key.nil?
        raise EmbedlyTagError "You must provide embed.ly api key."
      end

      embed @url
    end

    private

    def live_response(url)
      domain = Domainatrix.parse(url).domain
      params = (@config[domain] || {}).merge @parameters

      embedly_url = ComposeURL.new("http://api.embed.ly/1/oembed")

      if domain == "youtube" && params["rel"] == "0"
        youtube_url = ComposeURL.new(url)
        youtube_url.add_param("rel", "0")
        url = youtube_url.to_s
        params.delete "rel"
      end

      embedly_url.add_param("key", @api_key)
      embedly_url.add_param("url", url)
      params.each { |k, v| embedly_url.add_param(k, v) }

      response = compose JSON.parse resolve embedly_url.to_s
      @cache.write(cache_key(url), response)
      response
    end

    def cached_response(url)
      @cache.read(cache_key(url))
    end

    def embed(url)
      cached_response(url) || live_response(url)
    end

    def compose(json_rep)
      type     = json_rep["type"]
      provider = json_rep["provider_name"].to_s.downcase

      if type    == "photo"
        url       = json_rep["url"]
        width     = json_rep["width"]
        height    = json_rep["height"]
        desc      = CGI::escapeHTML json_rep["description"]
        html      = "<img src=\"#{url}\" alt=\"#{desc}\" width=\"#{width}\" height=\"#{height}\" />"
      elsif type == "link"
        url       = json_rep["url"]
        title     = json_rep["title"]
        html      = "<a class=\"embedly-card\" href=\"#{url}\">#{title}</a><script async src=\"//cdn.embedly.com/widgets/platform.js\" charset=\"UTF-8\"></script>"
      else
        html = json_rep["html"]
      end

      "<div class=\"embed #{type} #{provider}\">#{html}</div>"
    end

    def resolve(url)
      response = Net::HTTP.get_response(URI(url))

      unless response["location"].nil? and response["location"].nil?
        resolve URI.parse(response["location"]) or
                URI.parse(response["location"])
      else
        response.body
      end
    end

  end

  class EmbedlyTagError < StandardError
    def initialize(msg)
      super(msg)
    end
  end

end

Liquid::Template.register_tag("embedly", JekyllEmbedlyPlugin::EmbedlyTag)
