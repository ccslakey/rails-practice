Rails.application.routes.draw do

  	get 'sessions/new'

	resources :articles do 
		resources :comments
	end
	
	get 'signup'  => 'users#new' 
	
	get 'login' => 'sessions#new'
	post 'login' => 'sessions#create'
	delete 'logout' => 'sessions#destroy'


	resources :users
	
	root 'welcome#index'

	end
