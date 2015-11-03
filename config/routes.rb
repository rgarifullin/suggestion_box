SuggestionBox::Engine.routes.draw do
  root to: 'suggestions#index'

  resources :suggestions do
    put 'like', on: :member
    put 'dislike', on: :member
    resources :comments
  end
end
