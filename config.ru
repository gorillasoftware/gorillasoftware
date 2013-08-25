require "rubygems"
require 'rack/contrib'
require 'rack-rewrite'

use Rack::ETag
use Rack::Rewrite do
  rewrite '/', '/index.html'
end

run Rack::Directory.new('build')
