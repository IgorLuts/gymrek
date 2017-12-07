require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:order) {create(:order, user: @user)}

  describe 'GET #index' do
    sign_in_user

    let(:orders) { create_list(:order, 2, user: @user) }

    before { get :index }

    it 'populates an array of all orders' do     
      expect(assigns(:orders)).to match_array(orders)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    sign_in_user

    before { get :show, id: order }

    it 'assings the requested order to @order' do
      expect(assigns(:order)).to eq order
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do

    describe 'cart empty' do
      it 'redirect to root_path when cart empty' do
        @shopping_cart = create(:shopping_cart)
        session[:shopping_cart_id] = @shopping_cart.id
        get :new
        expect(response).to redirect_to root_path
      end
    end

    describe 'cart not empty' do
      before(:example) do
        @shopping_cart = create(:shopping_cart)
        product = create(:product) 
        @shopping_cart.add(product, product.price)
        session[:shopping_cart_id] = @shopping_cart.id
      end

      it 'assigns a new Order to @order' do
        get :new
        expect(assigns(:order)).to be_a_new(Order)
      end

      it 'render new view' do
        get :new
        expect(response).to render_template :new
      end
    end

  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new order in database' do 
        expect {post :create, order: attributes_for(:order)}.to change(Order, :count).by(1)
      end

      it 'redirect to root_path' do 
        post :create, order: attributes_for(:order)
        expect(response).to redirect_to root_path
      end
     end

     context "with invalid attributes" do
      it 'does not save the order' do
        expect {post :create, order: attributes_for(:invalid_order)}.to_not change(Order, :count)
      end

      it 're-renders new view' do
        post :create, order: attributes_for(:invalid_order)
        expect(response).to render_template :new
      end
     end
  end


end