class Product < ActiveRecord::Base
  extend FriendlyId

  belongs_to :brand

  has_many :product_tags, dependent: :destroy
  has_many :tags, through: :product_tags
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories
  has_many :attachments, dependent: :destroy
  has_many :galleries, dependent: :destroy

  accepts_nested_attributes_for :attachments, allow_destroy: true
  accepts_nested_attributes_for :galleries, allow_destroy: true

  mount_uploader :image, ImageUploader

  scope :all_except, ->(product) { where.not(id: product.id) }
  scope :similar, ->(product) {
    joins(:tags).where('tags.name = ?', product.tags.first.name.to_s) if product.tags.present?
  }
  scope :novinki, -> { includes(:tags).where(tags: {name: 'novinki'}).references(:tags) }
  scope :popular, -> { includes(:tags).where(tags: {name: 'popular'}).references(:tags) }
  
  validates :categories, :tags, :title, :description, :image, :price, presence: true

  friendly_id :title, use: :slugged

  paginates_per 15

  def normalize_friendly_id(text)
    text.to_slug.normalize(transliterations: :russian).to_s
  end

  def delivery_cost
    if brand.name == 'Ладас'
      '0'
    elsif brand.name == 'Babygrai' && price > 1000
      '0'
    else
      '150'
    end
  end
end
