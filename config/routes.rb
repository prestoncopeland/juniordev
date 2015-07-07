Rails.application.routes.draw do
  resources :visitors
  root 'jobs#index'
  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :users
  resources :jobs do
    collection { get :search }
    collection { get :admin_index }
  end
end
