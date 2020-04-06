class FriendshipsController < ApplicationController
	 #before_action :find_user
   skip_before_action :verify_authenticity_token
  def create
    # current_user.active_friendships.build
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
     redirect_to cuser_users_path
  end

  def destroy
    @user = User.find(params[:followed_id])
    current_user.unfollow(@user)
     redirect_to cuser_users_path
  end

end
