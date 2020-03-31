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
	resources :friendships
	resources :users do
		member do
			get 'cuser'
			get 'showuserprofile'
      get 'following'
      get 'follower'
      get 'count'
    end
	end
	namespace :user do
		resources :posts do
    resources :comments 
end
end
end
