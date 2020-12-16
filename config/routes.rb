Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:index, :new, :create, :show]
  resources :destinations, only: [:show, :index]
  resources :posts, only: [:edit, :new, :create, :update, :show]

  patch 'posts/:id/like', to: 'posts#like', as: "like_post"
end
