module SuggestionBox
  module SuggestionsHelper
    def sortable(column, title = nil)
      title ||= column.titleize
      css_class = column == sort_column ? "current #{sort_direction}" : nil
      direction = (column == params[:sort] && params[:direction] == 'asc') ? 'desc' : 'asc'
      link_to title, { sort: column, direction: direction }, { class: css_class }
    end

    private

    def sort_column
      params[:sort] ? params[:sort] : 'title'
    end

    def sort_direction
      %w(wasc desc).include?(params[:direction]) ? params[:direction] : 'asc'
    end
  end
end
