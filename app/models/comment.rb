class Comment < ActiveRecord::Base
  belongs_to :product
  has_many :comment_replies
  
  validates :user_name, :body, presence: true

  default_scope { order(:updated_at) }
end
