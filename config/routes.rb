Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
	devise_for :users 
	root 'welcome#index'
	resources :posts do  
     member do
       get 'showuser' 
     end
		resources :showuser
	end
	resources :users , only: [:update] 
	namespace :user do
		resources :posts do
    resources :comments 
end
end
end
