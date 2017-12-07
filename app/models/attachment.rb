class Attachment < ActiveRecord::Base
  belongs_to :product
  validates :file, presence: true

  mount_uploader :file, DocumentUploader

  scope :uniq_by_product, -> { select('DISTINCT ON (product_id) *') }
end
