class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_user_role

  rescue_from CanCan::AccessDenied do |exception|
   respond_to do |format|
     format.json { head :forbidden, content_type: 'text/html' }
     format.html { redirect_back(fallback_location: root_path)
       flash[:danger] = exception.message
     }
     format.js   { head :forbidden, content_type: 'text/html' }
   end
 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
  end

  def initialize_user_role
    # if user_session[:current_role]
    #   User.current_role = user_session[:current_role]
    # else
    if current_user
      if !current_user.current_role.present?
        role = current_user.roles.first
  		  User.current_role = [role.name, role.description, Filial.where(:name => role.description).ids]
      end
    end
    # end
    # session[:current_role] = "Администратор"
	end

end
