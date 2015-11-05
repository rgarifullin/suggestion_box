require 'rails/generators/base'
module SuggestionBox
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../../templates', __FILE__)

      def copy_initializer
        template "suggestion_box.rb", "config/initializers/suggestion_box.rb"
      end
    end
  end
end
