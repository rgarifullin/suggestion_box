SuggestionBox::Engine.routes.draw do
  root to: 'suggestions#index'

  resources :suggestions do
    resources :comments
  end
end
