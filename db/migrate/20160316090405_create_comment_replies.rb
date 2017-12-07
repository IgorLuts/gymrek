class CreateCommentReplies < ActiveRecord::Migration
  def change
    create_table :comment_replies do |t|
      t.string :user_name
      t.string :body
      t.references :comment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
