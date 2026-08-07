class ArtistRole < ApplicationRecord
    validates :name, presence: true, uniqueness: true

  def display_name
    name
  end
end
