Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  get 'confirm' => 'homes#confirm'
end
