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
		resources :showuser
		resources :search
	end
	resources :categories
	resources :users , only: [:update] 
	namespace :user do
		resources :posts do
    resources :comments 
end
end
end
