Rails.application.routes.draw do
  resources :servers do
    patch :activate, on: :member
  end

  devise_for :users
  mount Monitoring::API => '/'
end
