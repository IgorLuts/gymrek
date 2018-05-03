ActiveAdmin.register Page do
  permit_params :title, :content, :slug, :meta_title, :meta_description, :meta_keywords,
                translations_attributes: [:id, :locale, :title, :content, :_destroy]

  filter :title
  filter :content

  index do
    selectable_column
    id_column
    column :title
    column('content') { |page| truncate page.content }
    column :created_at
    translation_status_flags
    actions
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.input :slug
      f.input :meta_title
      f.input :meta_description
      f.input :meta_keywords
    end
    f.inputs "Translated fields" do
      f.translated_inputs 'ignored title', switch_locale: false do |t|
        t.input :title
        t.input :content, as: :ckeditor
      end
    end
    f.actions
  end
end
