class PostsController < ApplicationController
	def index
     @posts = Post.where(status: 'publish').paginate(page: params[:page], per_page: 2)
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
		if params[:search].blank?  
			redirect_to(root_path, alert: "Empty field!")  
		else  
			@parameter = params[:search].downcase 
      category_ids = Category.where("name LIKE :search", search:  "%#{@parameter}%").ids
      @results = Post.where(category_id: category_ids) 
		end  
	end
end
 #@posts = Post.where(category_id: params[:srearch].to_i) unless params[:search].blank?