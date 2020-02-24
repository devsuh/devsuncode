class ApplicationController < ActionController::Base
	# before_action :authenticate_user!
	# skip_before_action :authenticate_user!, only: [:new, :create]
	 protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :roles_mask]) 
            devise_parameter_sanitizer.permit(:account_update, keys: [:name, :roles_mask])
        end
end







