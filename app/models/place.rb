class Place < ApplicationRecord
  validates :preferred_name, presence: true

  has_many :person_place_associations, dependent: :destroy
  has_many :people, through: :person_place_associations

  def display_name
    preferred_name
  end
end
