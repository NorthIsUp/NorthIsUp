# module Jekyll
#   # Defines the base class of AMP posts
#   class AmpPost < Page
#     def initialize(site, base, dir, post)
#       @site = site
#       @base = base
#       @dir = dir
#       @name = 'index.html.amp'
#       self.process(@name)
#       self.read_yaml(File.join(base, '_layouts'), 'amp.html')
#       self.data = post.data
#       self.data['body']          = post.content
#       # self.data['layout']        = post.data['layout']
#       # self.data['title']         = post.data['title']
#       # self.data['date']          = post.data['date']
#       # self.data['author']        = post.data['author']
#       # self.data['category']      = post.data['category']
#       self.data['canonical_url'] = post.url
#     end
#   end
#   # Generates a new AMP post for each existing post
#   class AmpGenerator < Generator
#     priority :low
#     def generate(site)
#       site.posts.docs.each do |post|
#         index = AmpPost.new(site, site.source, post.id, post)
#         index.render(site.layouts, site.site_payload)
#         index.write(site.dest)
#         site.pages << index
#       end
#     end
#   end
# end
