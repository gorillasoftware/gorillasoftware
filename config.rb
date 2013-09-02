set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :blog do |blog|
  blog.prefix = "blog"
  blog.layout = "layouts/blog"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.paginate = true
end

activate :syntax, lineanchors: 'line'

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true

set :haml, { ugly: true }

page "/feed.xml", :layout => false

activate :directory_indexes
activate :livereload

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  activate :gzip
  activate :favicon_maker
end

activate :deploy do |deploy|
  deploy.method   = :ftp
  deploy.host     = "ftp.gorillasoftware.ch"
  deploy.user     = "ftp1109386-sdecaste"
  deploy.password = File.read("#{Dir.home}/.middleman-ftp/kpricorn.org") rescue ""
  deploy.path     = "/gorillasoftware.ch"
end

activate :disqus do |d|
  d.shortname = "gorillasoftware"
end
