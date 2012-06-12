require 'test_helper'
require './lib/generators/rails_stars/star_generator'

class StarGeneratorTest < Rails::Generators::TestCase
  tests RailsStars::Generators::StarGenerator
  destination File.expand_path('../tmp', File.dirname(__FILE__))
  setup :prepare_destination

  test "Assert migration is properly created" do
    run_generator
    assert_migration "db/migrate/create_rails_stars_stars.rb"
  end
end
