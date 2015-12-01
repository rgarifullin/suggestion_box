module SuggestionBox
  class Photo < ActiveRecord::Base
    belongs_to :suggestion, class_name: 'SuggestionBox::Suggestion'

    validates_associated :suggestion

    mount_uploader :image, PhotoUploader
  end
end
