class CreateArtistRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :artist_roles do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps
    end

    add_index :artist_roles, :name, unique: true
  end
end
