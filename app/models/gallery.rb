class Gallery < ActiveRecord::Base
  belongs_to :product
  mount_uploader :image, GalleryUploader
end
