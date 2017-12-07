FactoryGirl.define do
  factory :product do
    title "Product title"
    description "Product description"
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'test.jpg')) }
    price 1000
    category { create(:category) }
    before(:create) do |product|
      product.tags << FactoryGirl.create(:tag)
    end
  end

  factory :sales_product, class: 'Product' do
    title "Sale product"
    description "Product description"
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'test.jpg')) }
    price 1000
    category { create(:category) }
    before(:create) do |product|
      product.tags << FactoryGirl.create(:tag, name: "sales")
    end
  end
end