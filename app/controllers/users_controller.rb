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
	def save_follow_role
		current_user.update(follow_role_params)
		redirect_to showuserprofile_user_path(current_user)
		flash[:notice] = 'successfully setting update'
	end

	def frequest	
		@users = User.all
		@freqs = Friendship.where(followed_id: current_user.id, status: "pending")
		# redirect_to frequest_user_path
	end

	def cuser
		@users = User.all.where("id != ?", current_user.id)
	end

	def following
		@user = User.find(params[:id])
		@users = @user.following.where(friendships:{status: 'follow'})

	end

	def follower
		@user = User.find(params[:id])
		@users = @user.followers
	end

	private
	def user_params
		params.require(:user).permit(:roles_mask)
	end
	def follow_role_params
		params.require(:user).permit(:follow_role)
	end
end