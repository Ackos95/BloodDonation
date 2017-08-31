class ApplicationController < ActionController::Base
  include Pundit

  # rescue_from Exception, with: :generic_error
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource_or_scope)
    my_profile_path 
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birth_date, :blood_type, :rh, :address, :phone_num, :lbo])
  end

  def user_not_authorized
    flash[:alert] = "Nemate odgovarajuća ovlašćenja za traženu akciju"
    redirect_back(fallback_location: root_path)
  end

  def generic_error(exp)
    flash[:alert] = "Došlo je do nepoznate greške!"
    Rails.logger.error(exp)
    redirect_back(fallback_location: root_path)
  end

end
