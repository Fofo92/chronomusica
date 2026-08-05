class AddDeathInformationToPeople < ActiveRecord::Migration[8.1]
  def change
    add_column :people, :death_date, :date

    add_column :people,
               :death_date_precision,
               :string,
               null: false,
               default: "exact"

    add_column :people,
               :death_date_basis,
               :string,
               null: false,
               default: "death"

    add_index :people, :death_date
  end
end
