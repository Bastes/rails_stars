#!/usr/bin/env rake

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

task :default => :spec

require 'yard'

YARD::Rake::YardocTask.new do |t|
  t.files   = ['app/**/*.rb', 'lib/rails_stars.rb', 'lib/generators/rails_stars/star_generator.rb', 'lib/rails_stars/**/*.rb', '-', 'README.markdown']
end
