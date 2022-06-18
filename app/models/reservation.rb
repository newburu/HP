class Reservation < ApplicationRecord

  # クラスメソッド
  def self.reservation
    reservations = Contact.all
    reservation_data = []
    reservations.each do |reservation|
      reservations_hash = {}
      reservations_hash.merge!(day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time)
      reservation_data.push(reservations_hash)
    end
  end  
end
