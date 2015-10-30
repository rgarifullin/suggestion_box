module SuggestionBox
  class Engine < ::Rails::Engine
    isolate_namespace SuggestionBox
    initializer "suggestion_box.url_helpers" do
      ActiveSupport.on_load(:action_controller) do
        helper Rails.application.routes.url_helpers
      end
    end
  end
end
