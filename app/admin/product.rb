ActiveAdmin.register Product do
  permit_params :title, :description, :image, :price, :available, :sales_info,
                :meta_title, :meta_description, :meta_keywords, :feature, :slug,
                :characteristics, :brand_id, :old_price, :video_url,
                tag_ids: [], category_ids: [],
                attachments_attributes: [:id, :file, :_destroy],
                galleries_attributes: [:id, :image, :_destroy]

  index do
    selectable_column
    id_column
    column :title
    column :price
    column :feature
    column :available
    column :created_at
    actions
  end

  filter :title, label: 'Поиск'
  filter :price

  form html: { multipart: true } do |f|
    f.inputs 'Product Details' do
      f.input :title
      f.input :slug if f.object.persisted?
      f.input :description, as: :ckeditor
      f.input :characteristics, as: :ckeditor
      f.input :image, as: :file
      f.input :video_url
      f.input :old_price
      f.input :price
      f.input :categories, as: :select, collection: Category.where(active: true)
      f.input :brand
      f.input :available
      f.input :sales_info
      f.input :feature, as: :select, collection: %w(sale new gift)
      f.input :tags
      f.input :meta_title
      f.input :meta_description
      f.input :meta_keywords
      f.inputs 'Attachment' do
        f.has_many :attachments, heading: false, allow_destroy: true do |a|
          a.input :file, as: :file, hint: a.object.try(:file_url)
        end
      end
      f.inputs 'Gallery' do
        f.has_many :galleries, heading: false, allow_destroy: true do |a|
          a.input :image, as: :file, hint: a.object.try(:image_url)
        end
      end
    end
    f.actions
  end

  csv do
    column('id', humanize_name: false)
    column('available', humanize_name: false)
    column('url', humanize_name: false) { |product| product_url(product) }
    column('price', humanize_name: false)
    column('currencyId', humanize_name: false) { 'UAH' }
    column('category', humanize_name: false)   { 'Детская брендовая обувь' }
    column('picture', humanize_name: false)    { |product| 'http://gymrek.com' + product.image.url }
    column('name', humanize_name: false, &:title)
    column('vendor', humanize_name: false) { |product| product.brand.name }
    column('delivery', humanize_name: false) { 'true' }
    column('local_delivery_cost', humanize_name: false, &:delivery_cost)
    column('local_delivery_days', humanize_name: false) { '1-2' }
  end
end
