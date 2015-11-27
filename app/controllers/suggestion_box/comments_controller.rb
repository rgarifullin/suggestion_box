require_dependency "suggestion_box/application_controller"

module SuggestionBox
  class CommentsController < ApplicationController
    load_and_authorize_resource class: SuggestionBox::Comment

    def create
      @comment = SuggestionBox::Comment.create(comment_params)
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end

    def destroy
      @comment = SuggestionBox::Comment.destroy(params[:id])
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:title, :comment, :commentable_type, :commentable_id, :user_id)
    end
  end
end
