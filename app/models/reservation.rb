class Reservation < ApplicationRecord
  # フック


  # アソシエーション
  belongs_to :contact, foreign_key: "contact_id"


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

  def self.check_reservation_day(day)
    day = day.to_date
    if day <= Date.today
      return '過去の日付、本日の日付は選択できません。明日以降の日程をお選びください'
    end
  end
end
