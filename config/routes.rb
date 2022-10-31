Rails.application.routes.draw do
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'homes#top'

  get 'top' => 'homes#top'
  post 'back' => 'homes#back'
  post 'create' => 'homes#create'
  post 'confirm' => 'homes#confirm'
  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resource :admin_user, only: [:new, :create, :show]
end
