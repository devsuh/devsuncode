class FriendshipsController < ApplicationController
	 #before_action :find_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    redirect_to cuser_user_path(@user)
  end

  # def destroy
  #   current_user.unfollow(User.find(params[:followed_id])
  #   redirect_to @user
  # end

end
