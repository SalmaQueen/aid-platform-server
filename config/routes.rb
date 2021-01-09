Rails.application.routes.draw do
devise_for :users, skip: :all
namespace :api do
  namespace :v1 do
    resources :sessions, only: [:create]
  end
end
 
end
