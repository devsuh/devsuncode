class User::CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:content)) 
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to post_path(@post)
		else
			flash[:notice] = "did not save"
	  end
  end

  # def show
  	
  # end

	def destroy
         @comment = Comment.find(params[:id])
        if @comment.destroy
          redirect_to post_path(@comment.post)
         else
      	  flash[:notice] = "did not delete"
      	end
  end
	# private
	# def comment_params
 #    	params.require(:comment).permit(:content)
	# end
end
