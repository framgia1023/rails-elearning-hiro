Rails.application.routes.draw do
  namespace :admin do
    get 'words/new'
  end
	root 'sessions#new'
	resources :users
	get '/feed', to: 'users#feed'
	#get '/login', to: 'sessions#new'
	delete '/logout', to: 'sessions#destroy'
	resources :sessions, only: [:create] 
	resources :relationships, only: [:create, :destroy]
	resources :categories, only: [:index]

	resources :users do
    member do
    	get :following, :followers
		end
		resources :words, only: [:index]
	end

	namespace :admin do
		resources :users, only: [:index, :destroy, :update]
		resources :categories do
			resources :words
		end
	end

	resources :lessons do
		resources :answers 
	end

end
