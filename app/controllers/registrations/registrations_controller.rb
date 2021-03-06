class Registrations::RegistrationsController < Devise::RegistrationsController
before_action :configure_sign_up_params, only: [:create]

  def new
    super
  end

  def create
    super
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :date_of_birth])
  end
end
