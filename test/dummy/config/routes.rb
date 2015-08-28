Rails.application.routes.draw do

  mount SuggestionBox::Engine => "/suggestion_box"
end
