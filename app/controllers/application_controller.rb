class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Define para onde o usuário será redirecionado após login
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || "/admin" # Redireciona para o painel admin
  end

  # Define para onde o usuário será redirecionado após logout
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # Redireciona para a tela de login
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
