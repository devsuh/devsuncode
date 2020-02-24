class User::PostsController < ApplicationController
	def index
     @posts = current_user.posts
  end
 
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
 
  def new
  	@post = current_user.posts.new
  end
 
  def edit
     @post = Post.find(params[:id])
    #  if @post.user_id == current_user.id
    #       redirect_to user_post_path(@post)
    #  else
    #   flash[:notice] = 'you are not owner of this Job'
    # end
  end
 def create
  @post = current_user.posts.build(post_params)
   @post.status = params[:commit]
    if @post.save!
     redirect_to posts_path 
     else
     render 'new'
     end
 end
  def update
    @post = Post.find(params[:id])
	    if @post.update(post_params)
        # @post.status = params[:commit]
        # if @post.save!
        @post.update_attribute(:status, params[:commit])
	      redirect_to user_posts_path
	      flash[:notice] = 'successfully change '
	    else
	      render 'edit'
	    end
  end
  def destroy
    @post = Post.find(params[:id])
    if @post.present?
      @post.destroy
    end
    redirect_to user_posts_path
  end
 
  private
    def post_params
      params.require(:post).permit(:blog, :title)
    end
end
