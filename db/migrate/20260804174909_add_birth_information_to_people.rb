class AddBirthInformationToPeople < ActiveRecord::Migration[8.1]
  def change
    add_column :people, :birth_date, :date

    add_column :people,
               :birth_date_precision,
               :string,
               null: false,
               default: "exact"

    add_column :people,
               :birth_date_basis,
               :string,
               null: false,
               default: "birth"
    add_index :people, :birth_date
  end
end
