class SortService
  def initialize(list, params)
    @suggestions = list
    @params = params
  end

  def sort
    sorted =
      case sort_column
      when 'title'        then sort_by_title
      when 'status'       then sort_by_status
      when 'comments'     then sort_by_comments
      when 'likes'        then sort_by_likes
      when 'last_comment' then sort_by_last_comment
      end

    check_reverse(sorted)
  end

  private

  def sort_column
    @params[:sort] ? @params[:sort] : 'title'
  end

  def sort_direction
    %w(wasc desc).include?(@params[:direction]) ? @params[:direction] : 'asc'
  end

  def diff(a)
    a.get_upvotes.size - a.get_downvotes.size
  end

  def check_reverse(list)
    if sort_direction == 'desc'
      list.reverse
    else
      list
    end
  end

  def sort_by_title
    @suggestions.order(sort_column)
  end

  def sort_by_status
    @suggestions.order(sort_column)
  end

  def sort_by_comments
    @suggestions.to_a.sort { |a, b| a.comments.size <=> b.comments.size }
  end

  def sort_by_likes
    @suggestions.to_a.sort { |a, b| diff(a) <=> diff(b) }
  end

  def sort_by_last_comment
    @suggestions.to_a.sort do |a, b|
      if a.comments.last && b.comments.last
        a.comments.last.created_at <=> b.comments.last.created_at
      else
        a.comments.last ? 1 : 0
      end
    end
  end
end
