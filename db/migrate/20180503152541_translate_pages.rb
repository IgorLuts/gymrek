class TranslatePages < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        Page.create_translation_table!({
          title: :string,
          content: :string
        }, {
          migrate_data: true
        })
      end

      dir.down do
        Page.drop_translation_table! migrate_data: true
      end
    end
  end
end
