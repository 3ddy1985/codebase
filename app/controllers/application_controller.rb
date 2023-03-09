class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    def resource_name
      :user
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :email, :password, :profile_picture, :location, :bio])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :email, :password, :current_password, :profile_picture, :location, :bio])
    end

    protected

    rescue_from ActiveRecord::RecordNotUnique, with: :show_error_message

    def show_error_message(exception)
      flash[:alert] = 'Username has already been taken'
      redirect_to new_user_registration_path
    end        
end
