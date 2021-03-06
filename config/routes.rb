Rails.application.routes.draw do
  root to: "videos#index"
  get '/video/change', to: 'videos#change'
  post 'videos/:id/subtitle', to: 'videos#add_subtitle'
  resources :videos
  resources :users, except: [:edit, :update, :destroy]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'tags/', to: 'videos#index'
  get 'videos/:id/editor', to: 'videos#display_editor'
  post '/videos/:id/audio', to: 'videos#add_audio'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
