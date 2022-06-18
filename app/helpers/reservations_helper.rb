module ReservationsHelper
  def times
    times = %w(9:00 10:00 11:00 12:00 13:00 14:00 15:00 16:00 17:00 18:00 19:00 20:00 21:00)
  end

  def check_reservation(reservations, day, time)
    result = false
    reservation_count = reservations.count
    if reservation_count > 1
      reservations.each do |reservation|
        result = reservation[:day].eql?(day.strftime("%Y-%m-%d")) && reservation[:time].eql?(time)
      end
    elsif reservation_count == 1
      result = reservations[0][:day].eql?(day.strftime("%Y-%m-%d")) && reservations[0][:time].eql?(time)
    end
    return result
  end
end
