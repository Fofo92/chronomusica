class CreateWorkContributions < ActiveRecord::Migration[8.1]
  def change
    create_table :work_contributions do |t|
      t.references :person, null: false, foreign_key: true
      t.references :work, null: false, foreign_key: true
      t.string :contribution_role, null: false

      t.timestamps
    end

    add_index(
      :work_contributions,
      [ :person_id, :work_id, :contribution_role ],
      unique: true,
      name: "index_work_contributions_on_identity"
    )
  end
end
