ActiveAdmin.register Article do
  permit_params :content, :description, :title, :meta_title, :meta_description, :meta_keywords, :slug

  filter :title
  filter :content

  index do
    selectable_column
    id_column
    column :title
    column('content') { |page| truncate page.content }
    column :created_at
    actions
  end

  form html: { multipart: true } do |f|
    f.inputs 'Product Details' do
      f.input :title
      f.input :slug if f.object.persisted?
      f.input :description, as: :ckeditor
      f.input :content, as: :ckeditor
      f.input :meta_title
      f.input :meta_description
      f.input :meta_keywords
    end
    f.actions
  end
end
