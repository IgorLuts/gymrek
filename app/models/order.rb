class Order < ActiveRecord::Base
  has_many :shopping_cart_items, dependent: :destroy
  belongs_to :user
  validates :name, :adress, :phone, presence: true

  def add_line_items_from_cart(cart)
    cart.shopping_cart_items.each do |item|
      item.owner_id = nil
      item.owner_type = nil
      shopping_cart_items << item
    end
  end

  def add_total_price(cart)
    self.total_price = cart.total
  end
end
