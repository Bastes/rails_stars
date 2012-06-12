require 'rails/generators'

module RailsStars
  module Generators
    class StarGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path("../templates", __FILE__)

      desc "This generator creates the migration for the RailsStars gem Star model"
      def create_star_migration
        migration_template "migration.rb", "db/migrate/create_rails_stars_stars.rb"
      end

      def self.next_migration_number(dirname) # :nodoc:
        # FIXME once rails ships with a detachable (orm-agnostic ?) next_migration_number method, use it instead
        next_migration_number = current_migration_number(dirname) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end
    end
  end
end
