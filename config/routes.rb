Rails.application.routes.draw do
  resources :servers do
    member do 
      patch :activate
      resources :snapshots, only: :index do
        collection do
          get :cpu
          get :memory
          get :disks
        end
      end
    end
  end


  devise_for :users
  mount Monitoring::API => '/'
end
