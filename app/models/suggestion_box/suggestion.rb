module SuggestionBox
  class Suggestion < ActiveRecord::Base
    acts_as_commentable class_name: 'SuggestionBox::Comment'
    acts_as_votable

    has_many :photos, class_name: 'SuggestionBox::Photo', dependent: :destroy
    accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].nil? }
    belongs_to :user, class_name: SuggestionBox.author_class || 'User'

    validates_length_of :photos, maximum: 5
    validates :title, presence: true

    enum status:{
      discussion: 0,
      accepted: 1,
      declined: 2,
      done: 3
    }
  end
end
