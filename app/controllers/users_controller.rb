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
   private
    def user_params
      params.require(:user).permit(:roles_mask)
    end
end