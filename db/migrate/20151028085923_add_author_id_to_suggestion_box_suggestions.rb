class AddAuthorIdToSuggestionBoxSuggestions < ActiveRecord::Migration
  def change
    add_column :suggestion_box_suggestions, :author_id, :integer
  end
end
