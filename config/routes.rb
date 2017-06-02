Rails.application.routes.draw do
  resources :comments
  resources :image_posts
  resources :text_posts
  resources :posts
  resources :users
  root  'posts#index'
  get 'signup', to: 'users#new', as: 'signup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
