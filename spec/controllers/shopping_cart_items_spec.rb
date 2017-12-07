require 'rails_helper'

RSpec.describe ShoppingCartItemsController, type: :controller do
  let(:product) { create(:product) }

  describe 'POST #create' do
    context 'without quantity attributes' do
      it 'saves the new item in database' do 
        expect {post :create, product_id: product.id}.to change(ShoppingCartItem, :count).by(1)
      end

      it 'redirect to shopping_cart_path' do 
        post :create, product_id: product.id
        expect(response).to redirect_to shopping_cart_path
      end
     end

     context "with quantity attributes" do
      it 'change product quantity' do
        post :create, product_id: product.id, shopping_cart_item: {quantity: 2}
        expect(ShoppingCartItem.last.quantity).to eq(2)
      end
     end
  end

  describe 'DELETE #destroy' do
    
    it 'deletes line item' do
      post :create, product_id: product.id
      expect { delete :destroy, product_id: product.id}.to change(ShoppingCartItem, :count).by(-1)
    end

    it 'redirect to shopping_cart_path' do
      delete :destroy, product_id: product.id
      expect(response).to redirect_to shopping_cart_path
    end
  end
end