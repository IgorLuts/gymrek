# encoding: utf-8
require 'carrierwave'

class CkeditorAttachmentFileUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include Ckeditor::Backend::CarrierWave

  def store_dir
    "uploads/ckeditor/attachments/#{model.id}"
  end

  def extension_white_list
    Ckeditor.attachment_file_types
  end
end
