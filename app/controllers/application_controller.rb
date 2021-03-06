class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # include CanCan::ControllerAdditions

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		if current_user.present?
      root_path
    else
      new_user_session_path
    end


    if current_user.admin == true
	    rails_admin.index_path("rails_admin")
	  else
      root_path
 	  end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
