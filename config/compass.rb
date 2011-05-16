require "staticmatic/compass"

project_type = :staticmatic

Compass.configuration do |config|
  # project_path should be the directory to which the sass directory is relative.
  # I think maybe this should be one more directory up from the configuration file.
  # Please update this if it is or remove this message if it can stay the way it is.
  config.fonts_dir = File.join('stylesheets','fonts')
end