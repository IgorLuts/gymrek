class DestroyRatirate < ActiveRecord::Migration
  def change
    remove_index :rating_caches, column: ["cacheable_id", "cacheable_type"]
    drop_table :average_caches
    drop_table :overall_averages
    drop_table :rating_caches
  end
end
