class Category < ActiveRecord::Base
  extend FriendlyId

  has_and_belongs_to_many :products

  has_ancestry :orphan_strategy => :rootify, :cache_depth => true

  friendly_id :name, use: :slugged

  def normalize_friendly_id(text)
    text.to_slug.normalize(transliterations: :russian).to_s
  end

  def products_with_children
    return products unless has_children?
    children.inject(products) { |a, e| a << e.products }
  end
end
