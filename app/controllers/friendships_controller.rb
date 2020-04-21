class FriendshipsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    render 'alluser'
  end

  def destroy
    @user = User.find(params[:followed_id])
    current_user.unfollow(@user)
    render 'alluser'
   
  end
  def removerequest
    @abc = Friendship.where(followed_id: current_user.id, follower_id: params[:followed_id])
    @abc.destroy_all
  end

  def update
    #binding.pry
    @abc = Friendship.where(followed_id: current_user.id, follower_id: params[:followed_id])
    @abc.update(status: "follow")
  end

  def alluser
    @users = User.all.where("id != ?", current_user.id)
  end
end
