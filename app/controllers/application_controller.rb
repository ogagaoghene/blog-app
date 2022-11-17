class ApplicationController < ActionController::Base
  protect_from_forgery prepend: false
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_login!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_ability
    @current_ability ||= Ability.new(current_login)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email password password_confirmation])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
