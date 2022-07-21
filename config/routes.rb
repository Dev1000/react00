# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  post '/post/:id', to: 'posts#update'
  post '/posts', to: 'posts#create'
  get 'posts/index'

  get 'users/dashboard'
  devise_for :users
  get 'hello_world', to: 'hello_world#index'

  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
