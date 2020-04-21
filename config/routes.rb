Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'posts#index' 
	# root 'welcome#index'
  get "/user/posts/:year/:month/:id-:title" => "user/posts#show", :as => :ushow
   get "/posts/:year/:month/:id-:title" => "posts#show", :as => :pshow
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
   delete 'removerequest'
 end
end
resources :users do
  collection do 
   get 'cuser'
   put 'save_follow_role'
 end
 member do
   get 'frequest'
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
