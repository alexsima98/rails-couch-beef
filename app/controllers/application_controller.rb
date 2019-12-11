class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # before_action :configure_sign_up_params, only: [:create]

  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :avatar])
  # end

  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :avatar])
  # end
end
