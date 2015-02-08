Rails.application.routes.draw do
  devise_for :users
  mount Monitoring::API => '/'
end
