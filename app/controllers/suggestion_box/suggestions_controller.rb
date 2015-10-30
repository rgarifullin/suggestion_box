require_dependency "suggestion_box/application_controller"

module SuggestionBox
  class SuggestionsController < ApplicationController
    before_action :set_suggestion, only: [:show, :edit, :update, :destroy]

    def index
      @suggestions = Suggestion.all
    end

    def show
    end

    def new
      @suggestion = Suggestion.new
    end

    def edit
    end

    def create
      @suggestion = Suggestion.new(suggestion_params)

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

    private

    def set_suggestion
      @suggestion = Suggestion.find(params[:id])
    end

    def suggestion_params
      params.require(:suggestion).permit(:title, :text, :user_id, :author_id)
    end
  end
end
