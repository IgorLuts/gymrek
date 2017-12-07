# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [220, 220]
  end

  version :preview do
    process resize_to_fit: [500, 500]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
