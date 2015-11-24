require 'rails/generators'
module SuggestionBox
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../app/views/suggestion_box", __FILE__)
      desc "Used to copy suggestion_box's views to your application's views."

      def copy_views
        view_directory :comments
        view_directory :suggestions
      end

      protected

      def view_directory(name)
        directory name.to_s, "app/views/suggestion_box/#{name}"
      end
    end
  end
end
