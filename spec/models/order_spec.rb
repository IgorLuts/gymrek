require 'rails_helper'

RSpec.describe Order, type: :model do

  it { should belong_to :user }
  it { should have_many :shopping_cart_items }

  it { should validate_presence_of :email }
  it { should validate_presence_of :name }
  it { should validate_presence_of :adress }
  it { should validate_presence_of :phone }

  describe 'order methods' do  
    before(:example) do
      @cart = create(:shopping_cart)
      product = create(:product) 
      @order = create(:order) 
      @cart.add(product, product.price)
      @order.add_line_items_from_cart(@cart)
    end

    it 'should add line items from cart' do
      expect(@order.shopping_cart_items.count).to eq(1)
    end

    it 'should add order total price from cart' do
      @order.add_total_price(@cart)

      expect(@order.total_price.to_i).to eq(@cart.total.to_i)
    end
  end

end
