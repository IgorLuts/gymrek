class DestroyRater < ActiveRecord::Migration
  def change
    remove_index :rates, column: ["rateable_id", "rateable_type"]
    remove_index :rates, column: ["rater_id"]
    drop_table :rates
  end
end
