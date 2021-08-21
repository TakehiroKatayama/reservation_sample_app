class Shop < ApplicationRecord
  has_many :reservations

  def remaining_seat(count_person)
    shop.capacity - count_person
  end

  def upper_limit
    capacity - reservation.count_person
  end
end
