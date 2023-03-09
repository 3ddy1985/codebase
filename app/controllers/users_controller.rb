class UsersController < ApplicationController
  before_action :set_current_user
  before_action :configure_permitted_parameters

  def profile
    @languages = current_user.languages
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:bio, :location])
    devise_parameter_sanitizer.permit(:account_update, keys: [:bio, :location])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :location, :bio)
  end

  def resource_class
    User
  end
  
  
  def languages
    @user = User.find(params[:id])
    @languages = @user.languages
    respond_to do |format|
      format.html { render partial: 'users/select_language_popup' }
      format.json { render json: @languages }
    end
  end

  def my_languages
    @user = User.find(params[:id])
    @languages = @user.languages
    render 'home/_my_languages'
  end

  def add_language
    language = Language.find(params[:language_id])
    @current_user.languages << language unless @current_user.languages.include?(language)
    head :ok
  end

  def remove_language
    language = Language.find(params[:language_id])
    @current_user.languages.delete(language)
    head :ok
  end

  def show
    @user = User.find(params[:id])
    render :show, locals: { user: @user }
  end
  

  private

  def set_current_user
    @current_user = User.find(current_user.id)
  end
end

  
