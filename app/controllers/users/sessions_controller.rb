# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  after_action :say_hello, only: [:create]

  def after_sign_in_path_for(user)
		if user.is_a?(Admin)
      admin_tests_path
    else
      tests_path
    end
  end

  def say_hello
    flash.notice = "Привет, #{current_user.first_name}!" if current_user.first_name
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
end
