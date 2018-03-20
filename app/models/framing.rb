class Framing < ApplicationRecord
  has_many :images
  mount_uploader :picture, PictureUploader
end
