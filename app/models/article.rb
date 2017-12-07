class Article < ActiveRecord::Base
  extend FriendlyId
  
  paginates_per 10

  friendly_id :title, use: :slugged

  def normalize_friendly_id(text)
    text.to_slug.normalize(transliterations: :russian).to_s
  end
end
