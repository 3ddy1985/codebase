class LanguageCollectionsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]

  def create
    @language = Language.find(params[:language_id])
    @user.languages << @language
    render json: @language
  end

  def delete
    language_collection = LanguageCollection.find_by(user_id: params[:id], language_id: params[:id])
    if language_collection.destroy
      flash[:notice] = "Language removed successfully."
      render :main
    else
      flash[:alert] = "There was an error removing the language."
      render :main
    end

  end
  
  

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
