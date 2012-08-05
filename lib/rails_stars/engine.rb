module RailsStars
  class Engine < ::Rails::Engine
    require 'rails'
    require 'jquery-rails'
    require 'coffee-rails'
    require 'haml-rails'
    require 'sass-rails'
    require 'bourbon'

    isolate_namespace RailsStars
    engine_name 'rails_stars'
  end
end
