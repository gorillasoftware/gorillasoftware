helpers do
  def title
    title = "gorilla software"
    page_title = current_page.data.title
    if page_title.present?
      title = "#{page_title} ★ #{title}"
    end
    title
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :blog do |blog|
  blog.per_page = 3
  blog.prefix = "blog"
  blog.layout = "layouts/blog_article"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.paginate = true
  blog.summary_separator = /(READMORE)/
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
  activate :minify_javascript, ignore: ['require.js', 'f6854c8b.main']
  activate :minify_css
  activate :cache_buster
  activate :asset_hash
  activate :relative_assets
  activate :gzip
  activate :favicon_maker
  require "middleman-smusher"
  activate :smusher
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
