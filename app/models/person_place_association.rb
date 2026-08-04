class PersonPlaceAssociation < ApplicationRecord
  belongs_to :person
  belongs_to :place

  enum :association_type, {
    birth: "birth",
    death: "death"
  }

  validates :association_type, presence: true
  validates :person_id,
            uniqueness: {
              scope: [ :place_id, :association_type ]
            }
end
