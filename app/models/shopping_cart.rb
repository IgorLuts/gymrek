class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart

  def remove(object, quantity = 1)
    cart_item = item_for(object)
    return unless cart_item

    cart_item.delete
  end

  def total
    subtotal
  end

  def self.remove_old_records
    old_record = ShoppingCart.where('created_at < ?', 7.days.ago)
    delete(old_record)
  end

  def empty?
    false
  end
end
