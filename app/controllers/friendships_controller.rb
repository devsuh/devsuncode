class FriendshipsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    @users = User.all.where("id != ?", current_user.id)
    render 'alluser'
  end

  def destroy
    @user = User.find(params[:followed_id])
    current_user.unfollow(@user)
    @users = User.all.where("id != ?", current_user.id)
     render 'alluser'
  end

  def alluser
    @users = User.all.where("id != ?", current_user.id)
  end
end
