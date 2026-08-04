class WorkContribution < ApplicationRecord
  belongs_to :person
  belongs_to :work

  enum :contribution_role, {
    composer: "composer"
  }

  validates :contribution_role, presence: true

  validates :person_id,
            uniqueness: {
              scope: [ :work_id, :contribution_role ]
            }
end
