Rails.application.routes.draw do
	root 'home_pages#home'
	resources :users
	get '/feed', to: 'users#feed'
	get '/login', to: 'sessions#new'
	delete '/logout', to: 'sessions#destroy'
	resources :sessions, only: [:create]
	resources :relationships, only: [:create, :destroy]
	resources :users do
    member do
    	get :following, :followers
		end
	end
	
	namespace :admin do
		resources :users, only: [:index, :destroy]
		resources :categories
	end

end
