class PersonArtistRole < ApplicationRecord
  belongs_to :person
  belongs_to :artist_role
end
