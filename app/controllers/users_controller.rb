class UsersController < ApplicationController

	def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = 'successfully change '
     redirect_to post_showuser_index_path(@user)
   else
     render ''
   end
 end
def cuser
 @users = User.all.where("id != ?", current_user.id)
end
def following
 @user = User.find(params[:id])
 @users = @user.following
end
def follower
 @user = User.find(params[:id])
 @users = @user.followers
end
private
def user_params
  params.require(:user).permit(:roles_mask)
end
end