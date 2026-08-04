class CreatePlaces < ActiveRecord::Migration[8.1]
  def change
    create_table :places do |t|
      t.string :preferred_name, null: false
      t.string :alternate_names, array: true, default: []
      t.boolean :visible, null: false, default: true

      t.timestamps
    end

    add_index :places, :preferred_name
  end
end
