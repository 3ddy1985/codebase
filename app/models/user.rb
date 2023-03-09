class User < ApplicationRecord
  has_many :language_collections
  has_many :languages, through: :language_collections
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # attr_accessor :bio, :location

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
