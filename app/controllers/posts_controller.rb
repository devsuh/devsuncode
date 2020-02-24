class PostsController < ApplicationController
	def index
     @posts = Post.where(status: 'publish')
	end
	
	def show
		@post = Post.find(params[:id])
	end

	def showblog
		 @post = Post.find(params[:id])
		 @comments = Post.find(params[:id]).comments
	end
	
end
