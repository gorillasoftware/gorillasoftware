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

  def article_date(date)
    {
      :iso8601 => date.strftime('%Y-%m-%dT%H:%M:%S%:z'),
      :year_name => date.strftime('%Y').to_i,
      :month_name => date.strftime('%B'),
      :day_name => date.strftime('%-e').to_i,
      :year_path => blog_year_path(date.strftime('%Y').to_i),
      :month_path => blog_month_path(date.strftime('%Y').to_i, date.strftime('%m').to_i),
      :day_path => blog_day_path(date.strftime('%Y').to_i, date.strftime('%m').to_i, date.strftime('%d').to_i)
    }
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
activate :cache_buster
activate :gzip

# Build-specific configuration
configure :build do
  activate :minify_javascript, ignore: ['require.js', 'f6854c8b.main']
  activate :minify_css

  activate :favicon_maker, :icons => {
    "_favicon_template.png" => [
      { icon: "apple-touch-icon-152x152-precomposed.png" },
      { icon: "apple-touch-icon-114x114-precomposed.png" },
      { icon: "apple-touch-icon-72x72-precomposed.png" },
      { icon: "favicon.png", size: "16x16" },
      { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
    ]
  }

  require "middleman-smusher"
  activate :smusher
  activate :asset_hash, ignore: ['require.js', 'f6854c8b.main']
end

activate :disqus do |d|
  d.shortname = "gorillasoftware"
end

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-24038149-1'
  ga.domain_name = 'gorillasoftware.ch'
  ga.allow_linker = true
end

foundation_dir = Gem::Specification.find_by_name("zurb-foundation").gem_dir
sprockets.append_path File.join(foundation_dir, 'js')
sprockets.append_path File.join(foundation_dir, 'scss')
