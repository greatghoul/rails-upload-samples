class Picture < ActiveRecord::Base
  belongs_to :post

  mount_uploader :picture, PictureUploader
end
