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

  has_many :person_artist_roles
  has_many :artist_roles, through: :person_artist_roles

  enum :birth_date_precision, {
    exact: "exact",
    approximate: "approximate"
  }

  enum :birth_date_basis, {
    birth: "birth",
    baptism: "baptism"
  }

  enum :death_date_precision, {
    exact: "exact",
    approximate: "approximate"
  }, prefix: :death

  enum :death_date_basis, {
    death: "death",
    burial: "burial"
  }, prefix: :death

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

  def death_date_known?
    death_date.present?
  end

  def birth_place
    person_place_associations
      .find { |association| association.birth? }
      &.place
  end

  def death_place
    person_place_associations
      .find { |association| association.death? }
      &.place
  end
end
