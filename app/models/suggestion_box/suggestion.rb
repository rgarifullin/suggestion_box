module SuggestionBox
  class Suggestion < ActiveRecord::Base
    # acts_as_commentable class_name: 'SuggestionBox::Comment'
    # acts_as_votable

    belongs_to :author, class_name: SuggestionBox.author_class || 'User'
  end
end
