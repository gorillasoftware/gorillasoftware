# COPYRIGHT: 2010 Aaron Cruz (aaron@aaroncruz.com)
# LICENSE: MIT
require 'fileutils'

module BlogHelper
  self.extend self

  def blog
    blog_options = {
    }
    
    rss_options = {
      :title       => "My Blog about Nothing",
      :author      => "Aaron Cruz",
      :email       => "aaron@aaroncruz.com",
      :description => "This blog is about absolutely nothing.  I swear!",
      :baseurl     => "http://aaroncruz.com"
    }
    
    blog = Blog.new(blog_options)
    blog.build_posts("#{File.dirname(__FILE__)}/../posts")
    blog.feeds(rss_options)
    blog.render_blog_page
  end
  
  class Blog
    
    def initialize(options)
    
    end
    
    def build_posts(postpath)
      path = "#{File.dirname(__FILE__)}/../../site/posts"
      Dir.mkdir(path) unless Dir.exist?(path)
      @posts = []
      files = []
      Dir["#{postpath}/*.haml"].each{ |file| files.push(file)}
      # sort posts chronologically
      files.sort.reverse.each{ |post| @posts.push(Post.new(post))}
    end
  
    def render_blog_page
      text = ''
      @posts.each{|post| text += post.teaser}
      text
    end
    
    def feeds(options)
      feed = Feed.new(@posts,options)
      feed.write_feeds
    end
  end
  
  # Path Class
  # 
  # returns linkpaths and post date paths and the formatted date for
  # given post
  # 
  class Path
    attr_reader :linkpath,:datepath,:hamlpath,:datestring,:date
    
    def initialize(filename,sitepath)
      @sitepath   = sitepath
      @postdir    = 'posts'
      @date       = get_date(filename)
      @datestring = stringify_date(@date)
      @file_title = date[:name]
      @datepath   = dir_structure(@date)
      @hamlpath   = get_haml_path
      @linkpath   = get_link
    end
    
    def get_date(filename)
      matches = filename.match(/(\d{4})-(\d\d)-(\d\d)-(.*)\.haml/).to_a
      {
        :year  => matches[1],
        :month => matches[2],
        :day   => matches[3],
        :name  => matches[4]
      }
    end
    
    def stringify_date(date)
      time = Time.local(date[:year],date[:month],date[:day])
      time.strftime("Posted %A %B %d, %Y")
    end
    
    def dir_structure(date)
      "#{date[:year]}/#{date[:month]}/#{date[:day]}"
    end
    
    def get_haml_path
      "#{@datepath}/#{@file_title}.haml"
    end
        
    def get_link
      "/#{@postdir}/#{@datepath}/#{@file_title}.html"
    end    
  end
  # Post Class
  # 
  # The balls of this helper
  # 
  # Creates post teaser for blog page,
  # renders post with post layout and writes post haml file
  # for staticmatic to convert
  # 
  # @params: String, filename - the name of the post file
  #          String, sitepath - the path to staticmatic /site directory *optional
  #          String, layoutpath - path to the post layout file
  # @attrs:  String, teaser - formatted teaser for post
  class Post        
    attr_reader :teaser, :meta

    def initialize(file,sitepath = nil,layoutpath = nil)
      sitepath   ||= "#{File.dirname(__FILE__)}/../../site"
      layoutpath ||= "#{File.dirname(__FILE__)}/../layouts/post.haml"
      @readmore  = "Read More..."
      @separator = "more"         # class of div to separate post for "Read More..." link
      # get raw haml from post
      haml  = File.read(file)
      # create a new path object for path info
      @path = Path.new(file, sitepath)
      # render haml for teasers
      html  = render_haml(haml,layoutpath)
      # write single post to file
      write_haml_file(html)
      # make teaser available
      @teaser = make_teaser(html)
    end
    # render haml file from post layout and raw post file
    def render_haml(haml,layoutpath)
      hash = extract_yaml(haml)
      @meta = hash[:meta]
      @meta.merge!({ 
        'link' => @path.linkpath,
        'updated' => @path.date
      })
      body = hash[:haml]
      Haml::Engine.new(File.read(layoutpath)).
        render(Object.new, {
          :post_link   => @meta['link'],
          :post_author => @meta['author'],
          :post_date   => @path.datestring,
          :post_title  => @meta['title'],
          :post_body   => Haml::Engine.new(body).render
        })      
    end
    # remove bottom part of post for readmore link in teaser
    def make_teaser(html)
      morePattern  = /(.*)<div class='#{@separator}'>/m      
      teaser = html.match(morePattern).to_a[1]      
      if(teaser)
        teaser + " <span class=\"readmore\"><a href=\"#{@path.linkpath}\" >#{@readmore}</a></span></div>"
      else
        html
      end
    end
    # extract yaml data from the top of the raw post file
    def extract_yaml(haml)
      matches = haml.match(/---(.*)---(.*)/m)
      haml    = matches[2]
      meta    = YAML.load(matches[1])
      { :haml => haml, :meta => meta }
    end
    # write haml file to disk to be converted and moved to /site/posts/... by staticmatic
    def write_haml_file(html)
      FileUtils.mkdir_p "#{File.dirname(__FILE__)}/../pages/posts/#{@path.datepath}"
      filepath = "#{File.dirname(__FILE__)}/../pages/posts/#{@path.hamlpath}"
      output = ":plain\n"
      html.split("\n").each do |line|
        output += "\t#{line}\n"
      end
      File.open(filepath,"w"){ |file| file.write(output) }
    end
  end
  # Feed Class
  # 
  # Writes rss,atom, and a universal feed located @
  # site/rss.xml, site/atom.xml, site/feed.xml respectively
  # 
  # @params: Array, posts - array of post objects
  #          Hash,  options - feed specific info like blog title and author info
  #                           edit options at the top of the page Blog#rss_options
  # 
  class Feed
    require 'nokogiri'
    
    def initialize(posts,options)
      @baseurl     = options[:baseurl]
      @title       = options[:title]
      @description = options[:description]
      @author      = options[:author]
      @email       = options[:email]
      @universal   = universalize(posts)
      @atom        = atomize(posts)
      @rss         = rssize(posts)
      @sitepath    = "#{File.dirname(__FILE__)}/../../site"
    end
    
    def atomize(posts)
      atom_feed = Nokogiri::XML::Builder.new do |xml|
        xml.feed( "xmlns" => "http://www.w3.org/2005/Atom" ){
          xml.title       @title
          xml.link        "#{@baseurl}/atom.xml"
          xml.description @description
          xml.updated     Time.now.strftime("%Y-%m-%dT%H:%M:%SZ")
          xml.author{
            xml.name  @author
            xml.email @email
          }
          posts.each do |post|
            xml.entry{
              xml.title       post.meta['title']
              xml.link        "#{@baseurl}#{post.meta['link']}"
              xml.description post.teaser
              xml.updated     Time.local(post.meta['updated'][:year],post.meta['updated'][:month],post.meta['updated'][:day]).strftime("%Y-%m-%dT%H:%M:%SZ")
            }
          end
        }
      end
      atom_feed.to_xml
    end
    
    def rssize(posts)
     rss_feed = Nokogiri::XML::Builder.new do |xml|
        xml.rss( "version" => "2.0" ){
          xml.channel{
            xml.title       @title
            xml.link        "#{@baseurl}/rss.xml"
            xml.description @description
            posts.each do |post|
              xml.item{
                xml.title       post.meta['title']
                xml.link        "#{@baseurl}#{post.meta['link']}"
                xml.description post.teaser
              }
            end
          }
        }
      end
      rss_feed.to_xml
    end
    
    def universalize(posts)
     rss_feed = Nokogiri::XML::Builder.new do |xml|
        xml.rss(
          "version"       => "2.0",
          "xmlns:content" =>  "http://purl.org/rss/1.0/modules/content/",
          "xmlns:wfw"     => "http://wellformedweb.org/CommentAPI/",
          "xmlns:dc"      => "http://purl.org/dc/elements/1.1/",
          "xmlns:atom"    => "http://www.w3.org/2005/Atom",
          "xmlns:sy"      => "http://purl.org/rss/1.0/modules/syndication/",
          "xmlns:slash"   => "http://purl.org/rss/1.0/modules/slash/"
        ){
          xml.channel{
            xml.title       @title
            xml.link        "#{@baseurl}/rss.xml"
            xml.description @description
            posts.each do |post|
              xml.item{
                xml.title       post.meta['title']
                xml.link        "#{@baseurl}#{post.meta['link']}"
                xml.description post.teaser
              }
            end
          }
        }
      end
      rss_feed.to_xml      
    end
    
    def write_feeds
      File.open("#{@sitepath}/feed.xml","w"){ |file| file.write(@universal)}
      File.open("#{@sitepath}/rss.xml","w"){ |file|  file.write(@rss)}
      File.open("#{@sitepath}/atom.xml","w"){ |file| file.write(@atom)}
    end
  end
end