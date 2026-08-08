class ArtistRole < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many :person_artist_roles, dependent: :destroy
    has_many :people, through: :person_artist_roles

  def display_name
    name
  end
end
