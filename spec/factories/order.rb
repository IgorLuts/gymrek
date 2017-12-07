FactoryGirl.define do
  factory :order do
    name "My name"
    adress "My adress"
    email "test@test.ru"
    phone "30951112233"
    user
  end

  factory :invalid_order, class: 'Order' do
    name nil
    adress nil
    email nil
    phone nil
    user
  end
end