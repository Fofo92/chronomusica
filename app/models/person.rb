class Person < ApplicationRecord
  validates :preferred_given_name, presence: true
  validates :preferred_family_name, presence: true

  has_many :person_place_associations, dependent: :destroy
  has_many :places, through: :person_place_associations

  has_many :work_contributions, dependent: :destroy
  has_many :works, through: :work_contributions

  has_many :parent_child_relationships_as_parent,
          class_name: "ParentChildRelationship",
          foreign_key: :parent_id,
          inverse_of: :parent,
          dependent: :destroy

  has_many :parent_child_relationships_as_child,
          class_name: "ParentChildRelationship",
          foreign_key: :child_id,
          inverse_of: :child,
          dependent: :destroy

  enum :birth_date_precision, {
    exact: "exact",
    approximate: "approximate"
  }

  enum :birth_date_basis, {
    birth: "birth",
    baptism: "baptism"
  }

  def preferred_name
    [
      preferred_given_name,
      preferred_family_name
    ].compact_blank.join(" ")
  end

  def display_name
    preferred_name
  end

  def birth_date_known?
    birth_date.present?
  end
end
