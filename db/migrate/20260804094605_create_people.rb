class CreatePeople < ActiveRecord::Migration[8.1]
  def change
    create_table :people do |t|
      t.string :preferred_given_name
      t.string :preferred_family_name
      t.string :alternate_given_names, array: true, default: []
      t.string :alternate_family_names, array: true, default: []
      t.string :sex, null: false, default: "unknown"
      t.boolean :visible

      t.timestamps
    end
  end
end
