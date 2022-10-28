Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'homes#top'

  get 'top' => 'homes#top'
  post 'back' => 'homes#back'
  post 'confirm' => 'homes#confirm'
end
