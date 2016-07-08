class ApplicationController < ActionController::Base

  include Pundit

  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError do |e|
    flash[:danger] = "Not Authorized!"
    redirect_to "/"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :email)
    end
    devise_parameter_sanitizer.permit(:account_update) do |account_params|
      account_params.permit(:name, :email, :password, :current_password)
    end
  end
end
