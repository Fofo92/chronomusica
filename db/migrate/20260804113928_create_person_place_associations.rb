class CreatePersonPlaceAssociations < ActiveRecord::Migration[8.1]
  def change
    create_table :person_place_associations do |t|
      t.references :person, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true
      t.string :association_type, null: false

      t.timestamps
    end

    add_index(
      :person_place_associations,
      [ :person_id, :place_id, :association_type ],
      unique: true,
      name: "index_person_place_associations_on_identity"
    )
  end
end
