Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get 'users/' => 'users#index'
  get 'users/new' => 'users#new', as: :new_user
  get 'users/:id' => 'users#show', as: :user
  post 'users/' => 'users#create'
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

  # get 'posts/' => 'posts#index'
  # get 'posts/new' => 'posts#new', as: :new_post
  # get 'posts/:id' => 'posts#show', as: :post
  # post 'posts/' => 'posts#create'
  # get 'posts/:id/edit' => 'posts#edit', as: :edit_post
  # patch 'posts/:id' => 'posts#update'
  # delete 'posts/:id' => 'posts#destroy'
  #
  # get 'comments/' => 'comments#index'
  # get 'comments/new' => 'comments#new', as: :new_comment
  # get 'comments/:id' => 'comments#show', as: :comment
  # post 'comments/' => 'comments#create'
  # get 'comments/:id/edit' => 'comments#edit', as: :edit_comment
  # patch 'comments/:id' => 'comments#update'
  # delete 'comments/:id' => 'comments#destroy'

  resources :posts do
    resources :comments
  end

end
