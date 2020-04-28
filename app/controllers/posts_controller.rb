class PostsController < ApplicationController
	def index 
		@posts = Post.all
		if params[:search].blank?  
			@posts = Post.where(status: 'publish').paginate(page: params[:page], per_page: 10)
		else 
			@parameter = params[:search]
			@posts = Post.joins(:category).where("categories.name ILIKE :search OR posts.title ILIKE :search", search: "%#{@parameter}%")
		end

	end

	def show
		@post     = Post.find(params[:id])
		@comments = @post.comments
	end

	def showuser
		@users = User.where.not(roles_mask: ['admin']) 
	end

	def search
		 
	end
	
end
     		# category_ids = Category.where("name LIKE :search", search:  "%#{@parameter}%").ids
      		# @posts = Post.where(category_id: category_ids)	

      	 # category_ids.each do |result|
      	 # 	binding.pry

      	 #@posts = Post.where(category_id: result[0], title: result[1])

      	 # end	
