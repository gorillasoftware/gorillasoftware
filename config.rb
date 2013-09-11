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
activate :gsass
activate :foundation_navigation
activate :bourbon

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  activate :gzip
  activate :favicon_maker
end

activate :disqus do |d|
  d.shortname = "gorillasoftware"
end

activate :s3_sync do |s3_sync|
  s3_sync.bucket      = 'gorillasoftware.ch'
  s3_sync.region      = 'eu-west-1'
  s3_sync.prefer_gzip = true
end

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-24038149-1'
  ga.domain_name = 'gorillasoftware.ch'
  ga.allow_linker = true
end
