class ParentChildRelationship < ApplicationRecord
  belongs_to :parent
  belongs_to :child
end

class ParentChildRelationship < ApplicationRecord
  belongs_to :parent,
             class_name: "Person",
             inverse_of: :parent_child_relationships_as_parent

  belongs_to :child,
             class_name: "Person",
             inverse_of: :parent_child_relationships_as_child

  validate :parent_and_child_must_be_distinct

  private

  def parent_and_child_must_be_distinct
    return if parent.blank? || child.blank?
    return unless parent == child

    errors.add(:child, "must be different from parent")
  end
end
