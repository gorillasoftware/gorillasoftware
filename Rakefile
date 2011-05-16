###
# Staticmatic rake starter file
# 
# Requires gems:
# - sprockets
# - juicer
# - highline/import
# - grit
# 
# What it does!
# 
# you can easily:
# - piece together and compress your javascript and css files
# - add, commit and push to git repos
# - quickly revert site to git revision number or log message
# - deploy to staging or production servers (using rsync)
# - run cron tasks (located in config/cron.rb)
# 
# @TODO
# - deploy that is more like capistrano using Net::SSH
# - better output on command line to see what is going on
# - refactor
# 
# Author:: Aaron Cruz
# Email:: aaron@aaroncruz
# 
# I hope you enjoy!
require "rubygems"

BASE         = File.dirname(__FILE__)
SRC          = "#{BASE}/src"
SITE         = "#{BASE}/site"
JSFILE       = "site.min.js"
LOCAL_REPO   = "path/to/local/repo"
REMOTE_REPO  = "remot git repo address" # not used yet
DEPLOY       = "your/server/deploy/to/dir"
S_PUBLIC_DIR = "path/to/staging/server/public/folder"
P_PUBLIC_DIR = "path/to/production/server/public/folder"
P_SSHUSER    = "your production server username"
S_SSHUSER    = "your staging server username"
S_SERVER     = "stagingserver.com"
P_SERVER     = "productionserver.com"

desc "Staticmatic build + compress js and css"
task :default => [:build,:css,:js]

desc "Install bundler gems into src/vendor/bundle/ and create symlink from your project's root /bin folder and bundler bin file"
task :bundle do
  puts "*** Installing Gems ***"
  sh   "bundle install --path src/vendor/bundle"
  puts "*** Creating Symlink ***"
  sh   "ln -s src/vendor/bundle/ruby/1.9.1/bin bin"
  puts <<-EOSTRING
  add a "bin/" to any of your comand line calls
  example: bin/staticmatic or bin/compass install blueprint
  or use 'bundle exec staticmatic build .' etc. 
EOSTRING
end

desc "Build the site including all dependencies"
task :build  do
  sh 'bundle exec staticmatic build .'
end

desc "Start staticmatic interactive server"
task :preview do
  sh 'bundle exec staticmatic preview .'
end

desc "Combine and compress javascript files"
task :js => [:sprocketize,:juicer]

desc "Just combine your js files."
task :sprocketize do
  require "bundler/setup"
  require 'sprockets'
  secretary = Sprockets::Secretary.new(
    :asset_root            => "site",
    :load_path             => ["src/javascripts/*"],
    :source_files          => ['src/javascripts/default.js'],
    :interpolate_constants => false
  )
  # Generate a Sprockets::Concatenation object from the source files
  concatenation = secretary.concatenation
  # Write the concatenation to disk
  concatenation.save_to("site/javascripts/#{JSFILE}")
  # Install provided assets into the asset root
  secretary.install_assets
end

desc "Just compress js files"
task :juicer do
    commands = [
       "bundle exec juicer merge -i #{SITE}/javascripts/#{JSFILE} -o #{SITE}/javascripts/temp.js",
       "mv #{SITE}/javascripts/temp.js #{SITE}/javascripts/#{JSFILE}"
    ].join(' && ')
  sh commands
end

desc "Compress CSS"
task :css do
  commands = [
    "bundle exec juicer merge -i #{SITE}/stylesheets/screen.css -o #{SITE}/stylesheets/temp.css",
    "mv #{SITE}/stylesheets/temp.css #{SITE}/stylesheets/screen.css"
  ].join(' && ')
  sh commands
end

desc "Git Push to Origin"
task :push do
  require "bundler/setup"
  require 'highline/import'  
  msg      = ask("Commit Message:  ") { |q| q.echo = true }
  cmd = [
    "git add .",
    "git commit -a -m \"#{msg}\"",
    "git push origin master"
  ].join(' && ')  
  sh cmd
end

desc "Reverts site on production server to previous version by revision hash"
task :revert do
  require "bundler/setup"
  require 'highline/import'
  require "grit"  
  repo = Grit::Repo.new("#{LOCAL_REPO}")  
  n    = ask("Revert How Many Steps  ") { |q| q.echo = true }
  n    = 0 if n == ''
  # checkout
  cmt = repo.commits 'master',100
  puts "*** Checking out commit ##{cmt[n.to_i]} ***"
  sh   "git checkout #{cmt[n.to_i]}"
  # deploy
  Rake::Task['update_server'].invoke
  # clean up
  sh   "git checkout master"
end

desc "Reverts site on production server to previous version by log string"
task :revert_to do
  require "bundler/setup"
  require 'highline/import'
  require "grit"
  
  repo = Grit::Repo.new("#{LOCAL_REPO}")  
  msg  = ask("Revert to which change: ") { |q| q.echo = true }
  # checkout
  puts "*** Checking out commit ##{msg} ***"
  sh   "git checkout :/\"#{msg}\""
  # deploy
  Rake::Task['pdeploy'].invoke
  # clean up
  sh   "git checkout master"
end

desc "Staging: Commit and push repo, build static site, compress files and update remote server"
task :sdeploy => [:push,:build,:css,:js,:update_staging]

desc "Production: Commit and push repo, build static site, compress files and update remote server"
task :pdeploy => [:push,:build,:css,:js,:update_production]

desc "Deploy to staging server using rsync"
task :update_staging do
  puts   "*** Deploying the Staging Server ***"
  system "rsync -avz --delete site/ #{S_SSHUSER}@#{S_SERVER}:#{S_PUBLIC_DIR}"
end

desc "Deploy to production server using rsync"
task :update_production do
  puts   "*** Deploying to Production Server ***"
  system "rsync -avz --delete site/ #{P_SSHUSER}@#{P_SERVER}:#{P_PUBLIC_DIR}"
end

desc "Perform repeated tasks on the site"
task :cron do
  puts    "*** Cron Starting ***"
  require "#{BASE}/config/cron.rb"
  puts    "*** Cron Exiting ***"
end
