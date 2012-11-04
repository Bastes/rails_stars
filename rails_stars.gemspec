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

  s.required_ruby_version     = '>= 1.9.3'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE.txt", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.0"
  s.add_dependency "jquery-rails", ">= 2.1.2"
  s.add_dependency "coffee-rails", ">= 3.2.2"
  s.add_dependency "sass-rails", ">= 3.2.1"

  s.add_development_dependency "therubyracer", ">= 0.10.2"
  s.add_development_dependency "sqlite3", ">= 1.3.6"
  s.add_development_dependency "rspec-rails", ">= 2.11.0"
  s.add_development_dependency "guard-rspec", ">= 2.1.0"
  s.add_development_dependency "shoulda-matchers", ">= 1.3.0"
  s.add_development_dependency "mocha", ">= 0.12.4"
  s.add_development_dependency "generator_spec", ">= 0.8.5"
  s.add_development_dependency "capybara", ">= 1.1.2"
  s.add_development_dependency "rdoc", ">= 3.12"
  s.add_development_dependency "redcarpet", ">= 2.1.1"
  s.add_development_dependency "yard", ">= 0.8.2.1"
  s.add_development_dependency "haml-rails", ">= 0.3.5"
end
