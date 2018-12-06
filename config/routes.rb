Rails.application.routes.draw do
root 'home_pages#home'
resources :users
end
