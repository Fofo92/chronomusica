class Person < ApplicationRecord
  def display_name
    [ preferred_given_name, preferred_family_name ].compact_blank.join(" ")
  end
end
