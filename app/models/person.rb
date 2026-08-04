class Person < ApplicationRecord
  def preferred_name
    [
      preferred_given_name,
      preferred_family_name
    ].compact_blank.join(" ")
  end

  def display_name
    preferred_name
  end
end
