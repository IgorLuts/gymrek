class RemoveGalleryFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :gallery, :json
  end
end
