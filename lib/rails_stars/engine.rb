module RailsStars
  # The RailsStars::Engine plugs the gem into your gem project
  class Engine < ::Rails::Engine
    isolate_namespace RailsStars
    engine_name 'rails_stars'
  end
end
