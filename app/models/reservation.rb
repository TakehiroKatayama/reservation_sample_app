class Reservation < ApplicationRecord
  belongs_to :shop

  def self.decrement(count_person)
    Shop.select(:capacity) - count_person
  end

  def remaining_seat(count_person)
    reservation.shop.capacity - count_person
  end

  # reservation.date.のday.のshop.capcty - count_person
end
