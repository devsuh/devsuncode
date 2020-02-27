class PostsController < ApplicationController
	def index
		if params[:search].blank?  
			@posts = Post.where(status: 'publish').paginate(page: params[:page], per_page: 2)
		else  
			@parameter = params[:search].downcase 
			category_ids = Category.where("name LIKE :search", search:  "%#{@parameter}%").ids
			@posts = Post.where(category_id: category_ids).paginate(page: params[:page], per_page: 2)
	  end 
	end
	def show
		@post     = Post.find(params[:id])
		@comments = @post.comments
	end
	def showuser
		#@users = User.all
		@users = User.where.not(roles_mask: ['admin']) 
	end
	def search
	end
end
 