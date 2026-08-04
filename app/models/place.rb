class Place < ApplicationRecord
  validates :preferred_name, presence: true

  def display_name
    preferred_name
  end
end
