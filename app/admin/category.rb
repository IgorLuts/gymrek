ActiveAdmin.register Category do
  menu parent: :products

  permit_params :name, :active, :description, :meta_title, :meta_description,
                :meta_keywords, :slug, :custom_style,
                translations_attributes: [:id, :locale, :name, :description, :_destroy]

  sortable tree: true

  config.filters = false

  index as: :sortable do
    label :name
    actions
  end

  form do |f|
    f.inputs 'Category Details' do
      f.input :slug
      f.input :custom_style
      f.input :meta_title
      f.input :meta_description
      f.input :meta_keywords
      f.input :active
    end
    f.inputs "Translated fields" do
      f.translated_inputs 'ignored title', switch_locale: false do |t|
        t.input :name
        t.input :description, as: :ckeditor
      end
    end
    f.actions
  end
end
