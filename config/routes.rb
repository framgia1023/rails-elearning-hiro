Rails.application.routes.draw do
  namespace :admin do
    get 'words/new'
  end
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
	resources :categories, only: [:index]

	namespace :admin do
		resources :users, only: [:index, :destroy, :update]
		resources :categories do
			resources :words
		end
	end

end
