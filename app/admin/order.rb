ActiveAdmin.register Order do
  menu priority: 4

  config.filters = false

  index do
    column('Order', sortable: :id) { |order| link_to "##{order.id} ", admin_order_path(order) }
    column('Date', :created_at)
    column('Customer', &:name)
    column('Customer email', &:email)
    column('Customer phone', &:phone)
    column('Delivery address', &:adress)
    column('Total') { |order| number_to_currency order.total_price }
    actions
  end

  show do
    panel 'Invoice' do
      table_for(order.shopping_cart_items) do |t|
        t.column('Product') { |item| item.item.title }
        t.column('Quantity', &:quantity)
        t.column('Price') { |item| number_to_currency item.item.price }
        tr class: 'odd' do
          td
          td 'Total:', style: 'text-align: right;'
          td number_to_currency(order.total_price)
        end
      end
    end
  end
end
