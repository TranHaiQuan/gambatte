Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {registrations: "registrations"}
  root "posts#index"
  resources :posts do
    resources :friends
  end
  get "list_post", to: "posts#list_post"
  resources :comments do
    get "delete"
  end
  resources :likes, only: [:new, :create, :destroy]
  resources :friends
  resources :profiles, only: [:show] do
    resources :friends
  end
end
