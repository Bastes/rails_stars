$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_stars/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_stars"
  s.version     = RailsStars::VERSION
  s.authors     = ["Michel Bellevill"]
  s.email       = ["michel.belleville@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "Give stars to your models"
  s.description = "Rails Stars gives you ajax-y ratings shiny as stars."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE.txt", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"

  s.add_development_dependency "sqlite3"
end
