class LanguageCollection < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :language
end
