class CreatePersonArtistRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :person_artist_roles do |t|
      t.references :person, null: false, foreign_key: true
      t.references :artist_role, null: false, foreign_key: true

      t.timestamps
    end

    add_index(
      :person_artist_roles,
      [ :person_id, :artist_role_id ],
      unique: true
    )
  end
end
