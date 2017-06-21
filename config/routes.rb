Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  post 'sessions/create' => 'sessions#create'
  root 'welcome#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
