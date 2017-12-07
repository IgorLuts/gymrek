ActiveAdmin.register Comment, as: 'ProductComment' do
  menu parent: :products

  permit_params :user_name, :body, :approved, :product_id

  filter :product
  filter :approved

  form html: { multipart: true } do |f|
    f.inputs 'Product Details' do
      f.input :user_name
      f.input :body, as: :ckeditor
      f.input :approved
      f.input :product
    end
    f.actions
  end

  action_item :reply, only: :show do
    link_to 'Reply', new_admin_product_comment_comment_reply_path(product_comment)
  end

  show do
    attributes_table do
      row :user_name
      row :body
      row :approved
      row :product
    end

    panel 'Reply' do
      table_for product_comment.comment_replies do
        column :user_name
        column :body
        column :edit do |item|
          link_to('edit', edit_admin_product_comment_comment_reply_path(product_comment.id, item))
        end
        column :destroy do |item|
          link_to('destroy', admin_product_comment_comment_reply_path(product_comment.id, item), method: :delete)
        end
      end
    end
  end
end
