class Person < ApplicationRecord
  validates :preferred_given_name, presence: true
  validates :preferred_family_name, presence: true

  has_many :person_place_associations, dependent: :destroy
  has_many :places, through: :person_place_associations

  has_many :work_contributions, dependent: :destroy
  has_many :works, through: :work_contributions

  def preferred_name
    [
      preferred_given_name,
      preferred_family_name
    ].compact_blank.join(" ")
  end

  def display_name
    preferred_name
  end
end
