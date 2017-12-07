ActiveAdmin.register Tag do
  menu parent: :products

  permit_params :name
  config.filters = false
end
