Rails.application.routes.draw do
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users
  # get 'users/show'
  # get 'users/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#home"
end
