source 'https://rubygems.org'

require 'json'
require 'open-uri'
versions = JSON.parse(open('https://pages.github.com/versions.json').read)

gem 'github-pages', versions['github-pages']

group :jekyll_plugins do
    # gem "jekyll"
    gem "domainatrix"
    gem "compose_url"
    gem "jekyll-embedly-plugin"
end
