class CreateWorks < ActiveRecord::Migration[8.1]
  def change
    create_table :works do |t|
      t.string :preferred_title, null: false
      t.string :alternate_titles, array: true, default: []
      t.boolean :visible, default: true

      t.timestamps
    end

    add_index :works, :preferred_title
  end
end
