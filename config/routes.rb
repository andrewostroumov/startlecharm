Rails.application.routes.draw do
  mount Monitoring::API => '/'
end
