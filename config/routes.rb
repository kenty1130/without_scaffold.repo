Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :my_threads do
    resources :comments, controller: 'my_threads/comments'
  end

  root "my_threads#index"
end
