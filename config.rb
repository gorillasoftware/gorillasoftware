activate :livereload

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :blog do |blog|
  blog.prefix = "blog"
  # blog.permalink = ":year/:month/:day/:title.html"
  # blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "layouts/blog"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  blog.paginate = true
  blog.per_page = 3
  # blog.page_link = "page/:num"
end

activate :syntax, lineanchors: 'line'

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true

set :haml, { ugly: true }

page "/feed.xml", :layout => false

activate :directory_indexes

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  activate :gzip
  activate :gzip_assets
end

activate :deploy do |deploy|
  deploy.method   = :ftp
  deploy.host     = "ftp.gorillasoftware.ch"
  deploy.user     = "ftp1109386-sdecaste"
  deploy.password = File.read("#{Dir.home}/.middleman-ftp/kpricorn.org") rescue ""
  deploy.path     = "/gorillasoftware.ch"
end
