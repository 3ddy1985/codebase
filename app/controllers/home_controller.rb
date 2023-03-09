class HomeController < ApplicationController
    before_action :load_user_languages, only: [:main]

  def main
    @posts = Post.all.order(created_at: :desc)
    @user = current_user
    @post = Post.new
  end

  def destroy_user_language
    @user = User.find(params[:user_id])
    language = @user.languages.find_by(id: params[:language_id])
    if language.present?
      @user.languages.delete(language)
    end
    render 'main'
  end
  
  def create_user_language
    @user = User.find(params[:user_id])
    language = Language.find_by(id: params[:language_id])
    if language.present?
      @user.languages << language
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render partial: 'home/my_languages', locals: { user: @user } }
      end
    end
  end
  
  def my_languages
    @user = User.find(params[:id])
    @languages = @user.languages
  
    respond_to do |format|
      format.json { render json: @languages.to_json }
    end
  end
 
  

  private

  def load_user_languages
    @languages = current_user.languages
  end

  def load_user_languages
    @languages = current_user.language_collections.map(&:language)
  end
  
  
end
