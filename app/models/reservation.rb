class Reservation < ApplicationRecord
  # アソシエーション
  has_one :contact
  accepts_nested_attributes_for :contact


  # クラスメソッド
  def self.reservation
    reservations = Reservation.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    reservation_data = []
    reservations.each do |reservation|
      reservations_hash = {}
      reservations_hash.merge!(day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time)
      reservation_data.push(reservations_hash)
    end
    reservation_data
  end  
end
