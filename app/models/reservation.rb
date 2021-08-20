class Reservation < ApplicationRecord
  belongs_to :shop

  def self.decrement(count_person)
    Shop.select(:capacity) - count_person
  end
end
