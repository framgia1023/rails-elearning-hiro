Rails.application.routes.draw do
	root 'home_pages#home'
	resources :users
	get '/login', to: 'sessions#new'
	delete '/logout', to: 'sessions#destroy'
	resources :sessions, only: [:create]
	resources :relationships, only: [:create, :destroy]
end
