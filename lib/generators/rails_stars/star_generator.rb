require 'rails/generators'

module RailsStars
  module Generators
    # Creates the migration to integrate stars in your rails application
    class StarGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path("../templates", __FILE__)

      desc "This generator creates the migration for the RailsStars gem Star model"
      def create_star_migration
        migration_template "migration.rb", "db/migrate/create_rails_stars_stars.rb"
      end

      # This is a fix for getting the next migration number Rails should provide
      #
      # @return [String] the next migration number
      def self.next_migration_number(dirname)
        # FIXME once rails ships with a detachable (orm-agnostic ?) next_migration_number method, use it instead
        next_migration_number = current_migration_number(dirname) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end
    end
  end
end
