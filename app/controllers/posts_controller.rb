class PostsController < ApplicationController
	def index
     @posts = Post.where(status: 'publish').paginate(page: params[:page], per_page: 2)
     #@pos = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 2)
	end
	
	def show
		@post     = Post.find(params[:id])
		@comments = @post.comments
	end

	def showuser
		#@users = User.all
		@users = User.where.not(roles_mask: ['admin']) 
	end
end
 