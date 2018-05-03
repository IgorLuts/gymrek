class TranslateProducts < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        Product.create_translation_table!({
          title: :string,
          description: :text,
          characteristics: :string
        }, {
          migrate_data: true
        })
      end

      dir.down do
        Product.drop_translation_table! migrate_data: true
      end
    end
  end
end
