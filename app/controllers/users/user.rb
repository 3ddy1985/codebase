class User < ApplicationRecord
    has_one_attached :profile_picture

    has_many :language_collections
    has_many :languages, through: :language_collections
end
  