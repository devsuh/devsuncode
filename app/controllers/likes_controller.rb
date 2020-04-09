class LikesController < ApplicationController
	skip_before_action :verify_authenticity_token
	protect_from_forgery :except => [:create, :destroy]
	before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user_id: current_user.id)
    render 'allpost'
  end

  def destroy
    @post = Post.find(params[:post_id])
  	a = @post.likes.find(params[:like_id])
    a.destroy
   #User.find(current_user.id).likes.where(post_id: ).destroy_all
    render 'allpost'
  end
end
