Rails.application.routes.draw do
  root 'homes#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  namespace :api do
    namespace :v1 do
      # user
      post   '/auth', to: 'users#create'
      delete '/users', to: 'users#destroy'
      get    '/users', to: 'users#show'
      put    '/users', to: 'users#update'
      # login
      post '/login', to: 'sessions#create'
      # password
      post '/password_resets', to: 'password_resets#create'
      put  '/password_resets', to: 'password_resets#update'
      # detail
      put '/details', to: 'details#update'

      namespace :posts do
        # post
        get '/', to: 'posts#index'
        get '/:id', to: 'posts#show'
        post '/', to: 'posts#create'
        put  '/:id', to: 'posts#update'
        delete '/:id', to: 'posts#destroy'
        # comments
        get ':post_id/comments', to: 'comments#index'
        post ':post_id/comments', to: 'comments#create'
        delete ':post_id/comments/:id', to: 'comments#destroy'
        # likes
        get ':post_id/likes', to: 'likes#index'
        post ':post_id/likes', to: 'likes#create'
        delete ':post_id/likes', to: 'likes#destroy'
      end
    end
  end

  # react-router-domを使うためのルーティング
  match '*path', to: 'homes#index', via: :all
end

# == Route Map
#
