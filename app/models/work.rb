class Work < ApplicationRecord
  validates :preferred_title, presence: true

  def preferred_name
    preferred_title
  end

  def display_name
    preferred_name
  end
end
