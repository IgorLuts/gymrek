ActiveAdmin.register CommentReply do
  belongs_to :product_comment, parent_class: Comment

  permit_params :user_name, :body, :product_comment_id

  form do |f|
    f.inputs 'Reply Details' do
      f.input :user_name
      f.input :body, as: :ckeditor
    end
    f.actions
  end
end
