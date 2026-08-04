class Work < ApplicationRecord
  validates :preferred_title, presence: true

  has_many :work_contributions, dependent: :destroy
  has_many :contributors,
          through: :work_contributions,
          source: :person

  def preferred_name
    preferred_title
  end

  def display_name
    preferred_name
  end
end
