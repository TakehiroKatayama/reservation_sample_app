class Shop < ApplicationRecord
  has_many :reservations
  has_many :seats

  def upper_limit
    capacity - reservation.count_person
  end
end
