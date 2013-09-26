helpers do
  def title
    title = "gorilla software"
    page_title = current_page.data.title
    if page_title.present?
      title = "#{page_title} • #{title}"
    end
    title
  end

  def keywords
    kw = (current_page.data.tags || '').split(/,\W*/)
    kw.concat [
      'Software Development',
      'Softwareentwicklung',
      'Software',
      'Mobile Apps',
      'HTML5',
      'CSS',
      'Zürich',
      'Blog',
      'Schweiz',
      'Ruby',
      'Ruby on Rails',
      'Node.js',
      'Python',
      'Heroku',
      'Linux',
      'Git',
      'Consulting',
      'Coaching',
      'Javascript',
      'Open Source',
      'Web Design',
      'Responsive Design',
      'CoffeeScript',
      'Backbone.js',
      'Solr',
      'ELasticSearch',
      'RubyMotion',
      'Game development',
    ]
    kw.join ', '
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
sprockets.append_path File.join "#{root}", "bower_components"

activate :blog do |blog|
  blog.per_page = 5
  blog.prefix = "blog"
  blog.layout = "layouts/blog_article"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.paginate = true
  blog.summary_separator = /(READMORE)/
end

set :markdown,
  tables: true,
  autolink: true,
  gh_blockcode: true,
  fenced_code_blocks: true,
  smartypants: true,
  strikethrough: true
set :markdown_engine, :redcarpet


set :haml, { ugly: true }

page "/feed.xml", layout: false

activate :directory_indexes
activate :livereload
activate :gsass
activate :foundation_navigation
activate :bourbon
activate :asset_hash, ignore: ['require.js', 'f6854c8b.main']
activate :cache_buster
activate :gzip

# Build-specific configuration
configure :build do
  activate :minify_javascript, ignore: ['require.js', 'f6854c8b.main']
  activate :minify_css
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

foundation_dir = Gem::Specification.find_by_name("zurb-foundation").gem_dir
sprockets.append_path File.join(foundation_dir, 'js')
sprockets.append_path File.join(foundation_dir, 'scss')
