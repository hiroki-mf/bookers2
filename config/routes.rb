Rails.application.routes.draw do
  root to: "homes#top"
  #get 'users/index'
  #get 'users/show'
  #get 'users/edit'
  devise_for :users
  get 'books/new'
  get 'books' => 'books#index'
  post 'books' => 'books#create'
  #get '/top' => 'homes#top'
  get 'books/:id' => 'books#show', as: 'book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  get 'home/about' => 'homes#about'
  
  resources :users, only: [:index, :show, :edit, :update]
end
