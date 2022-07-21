# frozen_string_literal: true

Rails.application.routes.draw do
  post '/posts', to: 'posts#create'
  get 'posts/index'

  get 'users/dashboard'
  devise_for :users
  get 'hello_world', to: 'hello_world#index'

  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
