module SuggestionBox
  class Suggestion < ActiveRecord::Base
    acts_as_commentable class_name: 'SuggestionBox::Comment'

    belongs_to :user
  end
end
