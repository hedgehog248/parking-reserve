module ReservationsHelper
  def get_all_list(date)
    lists = []
    (1..4).each do |num|
      list = get_group_list(date, num)
      lists << list
    end
    lists
  end

  def get_group_list(date, num)
    Reservation.where(park_num: num).where(
      start_datetime: date.beginning_of_day..date.end_of_day
    ).or(
      Reservation.where(park_num: num).where(end_datetime: date.beginning_of_day..date.end_of_day)
    )
  end

  def check_reservation(lists, date, hour)
    unless lists.empty?
      lists.each do |reserv|
        result = (date + hour.hour).between?(reserv[:start_datetime], reserv[:end_datetime])
        return result if result == true
      end
    end
    false
  end
end
