class Page < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: :slugged

  translates :title, :content

  active_admin_translates :title, :content
end
