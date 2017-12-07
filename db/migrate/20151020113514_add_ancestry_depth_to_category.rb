class AddAncestryDepthToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :ancestry_depth, :integer, :default => 0
    Category.rebuild_depth_cache!
  end
end
