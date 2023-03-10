Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }
  patch '/users/:id/update_profile_picture', to: 'users/registrations#update_profile_picture', as: 'update_profile_picture'
  constraints ->(request) { request.env['warden'].user.nil? } do
    root to: 'landing#index'
  end
  root to: 'home#main', as: :authenticated_root
  get '/home', to: 'home#main'

  resources :languages do
    post 'add_to_user', on: :collection
  end

  resources :users do
    resources :language_collections, only: [:create, :destroy]
    get 'my_languages', on: :member
  end
  
  get '/languages', to: 'languages#index', format: 'json'

  resources :users do
    get 'languages', to: 'users#languages', format: 'json'
    post 'languages', to: 'users#create_language', format: 'json'
    resources :language_collections, only: [:create, :destroy]
  end
  
  # Add the following line
  post '/users/:user_id/language_collections', to: 'language_collections#create'
  delete '/users/:user_id/language_collections', to: 'language_collections#delete'
  delete '/users/:user_id/languages/:language_id', to: 'home#destroy_user_language', as: 'language_collection'

  get '/users/:id/languages', to: 'users#languages', format: 'json'
  post '/users/:id/languages', to: 'users#create_language', format: 'json'
  get '/users/:id/my_languages', to: 'users#my_languages'

  get '/home', to: 'pages#home', as: 'home_root'

  get 'posts/new', to: 'posts#new', as: 'new_post'
  delete '/posts/:id', to: 'posts#destroy', as: 'delete_post'
  get '/posts/:id/edit', to: 'posts#edit', as: 'edit_post'


  resources :posts, only: [:create, :destroy, :edit, :update]


end









 