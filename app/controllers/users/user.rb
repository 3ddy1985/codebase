class User < ApplicationRecord
    mount_uploader :profile_picture, ProfilePictureUploader
    # other code
  end
  