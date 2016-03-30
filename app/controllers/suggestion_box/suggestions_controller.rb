require_dependency "suggestion_box/application_controller"

module SuggestionBox
  class SuggestionsController < ApplicationController
    load_and_authorize_resource class: SuggestionBox::Suggestion

    before_action :set_suggestion, only: [:show, :edit, :update, :destroy, :like, :dislike]

    def index
      @suggestions = Suggestion.filter(params[:status]).includes(:comments)
      @suggestions = SortService.new(@suggestions, params).sort if params[:sort]
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
      @suggestion = Suggestion.new(suggestion_params)
      @suggestion.user_id = nil if @suggestion.anonymous

      if @suggestion.save
        redirect_to @suggestion, notice: 'Suggestion was successfully created.'
      else
        render :new
      end
    end

    def update
      if @suggestion.update(suggestion_params)
        redirect_to @suggestion, notice: 'Suggestion was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @suggestion.destroy
      redirect_to suggestions_url, notice: 'Suggestion was successfully destroyed.'
    end

    def like
      respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render :layout => false }
      if @suggestion.votes_for.map(&:voter_id).include?(current_user.id)
        @suggestion.unliked_by current_user
      else
        @suggestion.liked_by current_user
      end
     end
    end

    def dislike
      respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js { render :layout => false }
      if @suggestion.votes_for.map(&:voter_id).include?(current_user.id)
        @suggestion.undisliked_by current_user
      else
        @suggestion.disliked_by current_user
      end
     end
    end

    private

    def set_suggestion
      @suggestion = Suggestion.find(params[:id])
    end

    def suggestion_params
      params.require(:suggestion).permit(:title, :text, :user_id, :anonymous, :status, photos_attributes: [:image, :_destroy])
    end
  end
end
