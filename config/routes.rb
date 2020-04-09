Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
	devise_for :users
	root 'posts#index' 
	# root 'welcome#index'
	resources :posts do 
     member do
       get 'showuser'
       get 'search'   
     end
    resources :cuser
		resources :showuser
		resources :search
	end
	resources :categories
  resources :likes
	resources :friendships do
		collection do 
    	get 'alluser'
    end
  end
	resources :users do
    collection do 
    	get 'cuser'
    end
		member do
			get 'showuserprofile'
      get 'following'
      get 'follower'
    end
	end
	namespace :user do
		resources :posts do
      resources :comments 
    end
  end
end
