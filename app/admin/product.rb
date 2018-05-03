ActiveAdmin.register Product do
  permit_params :title, :description, :image, :price, :available, :sales_info,
                :meta_title, :meta_description, :meta_keywords, :feature, :slug,
                :characteristics, :brand_id, :old_price, :video_url,
                tag_ids: [], category_ids: [],
                attachments_attributes: [:id, :file, :_destroy],
                galleries_attributes: [:id, :image, :_destroy],
                translations_attributes: [:id, :locale, :title, :description, :characteristics, :_destroy]

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

  filter :title, label: 'Search'
  filter :price

  form html: { multipart: true } do |f|
    f.inputs 'Product Details' do
      f.input :slug if f.object.persisted?
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

    f.inputs "Translated fields" do
      f.translated_inputs 'ignored title', switch_locale: false do |t|
        t.input :title
        t.input :characteristics, as: :ckeditor
        t.input :description, as: :ckeditor
      end
    end
    f.actions
  end
end
