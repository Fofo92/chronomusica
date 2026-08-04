class CreateParentChildRelationships < ActiveRecord::Migration[8.1]
  def change
    create_table :parent_child_relationships do |t|
      t.references :parent, null: false, foreign_key: { to_table: :people }
      t.references :child, null: false, foreign_key: { to_table: :people }

      t.timestamps
    end

    add_index(
      :parent_child_relationships,
      [ :parent_id, :child_id ],
      unique: true
    )
  end
end
