class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
	#before_action :configure_permitted_parameters, if: :devise_controller

	def after_sign_in_path_for(resource)
    # check for the class of the object to determine what type it is
    	#binding.pry
    	dashboards_path
    end
	  protected

	  # def configure_permitted_parameters
	  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :contactnumber, :role])
	  # end
     add_flash_types :info, :error, :warning
end
