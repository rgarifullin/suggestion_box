module SuggestionBox
  class ApplicationController < ::ApplicationController
    before_filter :merge_abilities

    private

    def merge_abilities
      current_ability.merge(SuggestionBox::Ability.new(current_user))
    end
  end
end
