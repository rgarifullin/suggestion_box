require 'rails/generators/base'
require 'rails/generators/migration'
module SuggestionBox
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../../templates', __FILE__)

      def copy_initializer
        template "suggestion_box.rb", "config/initializers/suggestion_box.rb"
      end

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        migration_template "acts_as_votable_migration.rb", "db/migrate/acts_as_votable_migration.rb"
        migration_template "create_suggestion_box_suggestions.rb", "db/migrate/create_suggestion_box_suggestions.rb"
        migration_template "create_suggestion_box_comments.rb", "db/migrate/create_suggestion_box_comments.rb"
        migration_template "create_suggestion_box_photos.rb", "db/migrate/create_suggestion_box_photos.rb"
      end
    end
  end
end
