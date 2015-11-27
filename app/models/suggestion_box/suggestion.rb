module SuggestionBox
  class Suggestion < ActiveRecord::Base
    acts_as_commentable class_name: 'SuggestionBox::Comment'
    acts_as_votable

    belongs_to :user, class_name: SuggestionBox.author_class || 'User'

    enum status:{
      discussion: 0,
      accepted: 1,
      declined: 2,
      done: 3
    }
  end
end
