require 'spec_helper'
require "generator_spec/test_case"
require './lib/generators/rails_stars/star_generator'

describe RailsStars::Generators::StarGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path('../../tmp', __FILE__)
  before do
    prepare_destination
    run_generator
  end

  it 'creates the migration' do
    destination_root.should have_structure do
      directory "db" do
        directory "migrate" do
          migration "create_rails_stars_stars" do
            contains "class CreateRailsStarsStars"
          end
        end
      end
    end
  end
end
