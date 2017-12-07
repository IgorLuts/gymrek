class Brand < ActiveRecord::Base
  extend FriendlyId
  has_many :products, dependent: :destroy

  friendly_id :name, use: :slugged

  def normalize_friendly_id(text)
    text.to_slug.normalize(transliterations: :russian).to_s
  end
end
