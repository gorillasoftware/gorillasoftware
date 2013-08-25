use Rack::ETag
run Rack::Directory.new("build")
