class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.references :product, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
