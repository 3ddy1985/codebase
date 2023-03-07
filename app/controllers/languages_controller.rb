class LanguagesController < ApplicationController
        def add_to_user
          current_user.languages << Language.where(id: params[:language_ids].map(&:to_i))
        end
      
        def index
          @languages = Language.all
          render partial: 'select_language_popup', locals: { languages: @languages }
        end

        def destroy
          @language_collection = LanguageCollection.find_by(user_id: current_user.id, language_id: params[:id])
          if @language_collection.destroy
            render :main, notice: "Language removed from your collection."
          else
            render :main, alert: "Failed to remove language from your collection."
          end
        end
        
        
      end
      
  
