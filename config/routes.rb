Rails.application.routes.draw do
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  get 'confirm' => 'homes#confirm'
  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resource :admin_user, only: [:new, :create, :show]
end
