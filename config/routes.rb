SuggestionBox::Engine.routes.draw do
  resources :suggestions do
    put 'like', on: :member
    put 'dislike', on: :member
    resources :comments
  end
end
