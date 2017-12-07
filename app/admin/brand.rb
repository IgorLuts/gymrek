ActiveAdmin.register Brand do
  menu parent: :products

  permit_params :name

  config.filters = false

  form do |f|
    f.inputs 'Brand Details' do
      f.input :name
    end
    f.actions
  end
end
