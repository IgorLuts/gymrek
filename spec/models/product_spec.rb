require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should belong_to :category }
  it { should have_many :comments }
  it { should have_many :product_tags }
  it { should have_many :tags }

  it { should validate_presence_of :category }
  it { should validate_presence_of :tags }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :image }
  it { should validate_presence_of :price }

  it 'should choose all exept ones' do
    product = create(:product)
    another_product = create(:product)

    expect(Product.all_except(product)).to eq([another_product])
  end

  it 'should choose product with similar tags' do
    product = create(:product)
    another_product = create(:product)
    sale_product = create(:sales_product)

    expect(Product.similar(product)).to eq([product, another_product])

  end

end
