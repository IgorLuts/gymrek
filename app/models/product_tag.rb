class ProductTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :product
end
