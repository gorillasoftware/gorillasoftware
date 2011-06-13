# Haml options
set :haml, { :format => :html5 }

# Compass 960.gs support
require 'ninesixty'
require 'baseline'
require 'html5-boilerplate'
require 'grit'

# CodeRay syntax highlighting in Haml
# activate :code_ray

# Automatic sitemaps (gem install middleman-slickmap)
# require "middleman-slickmap"
# activate :slickmap

# Automatic image dimension calculations
# activate :automatic_image_sizes

# Per-page layout changes
# With no layout
# page "/path/to/file.html", :layout => false
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout

# Helpers
helpers do
  #   <%= google_analytics 'UA-XXXXXX-XX' %>
  # </body>
  # application_helper.rb
  def google_analytics(id = nil)
    content_tag(:script, :type => 'text/javascript') do
      "var _gaq = _gaq || [];
      _gaq.push(['_setAccount', '#{id}']);
      _gaq.push(['_trackPageview']);
      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })()"
    end unless id.blank?
  end

  def mixpanel(id = nil)
    content_tag(:script, :type => 'text/javascript') do
      "var mp_protocol = (('https:' == document.location.protocol) ? 'https://' : 'http://'); document.write(unescape('%3Cscript src=\"' + mp_protocol + 'api.mixpanel.com/site_media/js/api/mixpanel.js\" type=\"text/javascript\"%3E%3C/script%3E'));
      try {  var mpmetrics = new MixpanelLib('#{id}'); } catch(err) { null_fn = function () {}; var mpmetrics = {  track: null_fn,  track_funnel: null_fn,  register: null_fn,  register_once: null_fn, register_funnel: null_fn }; }"
    end unless id.blank?
  end

  def uservoice(id = nil)
    content_tag(:script, :type => 'text/javascript') do
      "(function() {
        var uv = document.createElement('script'); uv.type = 'text/javascript'; uv.async = true;
        uv.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'widget.uservoice.com/#{id}.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(uv, s);
      })();"
    end unless id.blank?
  end

  def version()
    repo = Grit::Repo.new(File.dirname(__FILE__))
    v = "#{repo.tags.last.message} (#{repo.recent_tag_name(nil, {:long => true})})"
  end
end

# Change the CSS directory
# set :css_dir, "alternative_css_directory"

# Change the JS directory
# set :js_dir, "alternative_js_directory"

# Change the images directory
# set :images_dir, "alternative_image_directory"

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
  
  # Enable cache buster
  activate :cache_buster
  
  # Use relative URLs
  activate :relative_assets
  
  # Compress PNGs after build (gem install middleman-smusher)
  require "middleman-smusher"
  activate :smusher

  # Generate ugly/obfuscated HTML from Haml
  # activate :ugly_haml
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end
