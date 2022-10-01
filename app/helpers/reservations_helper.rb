module ReservationsHelper

  def get_all_list(date)
    lists = []
    (1..4).each do |num|
      list = get_group_list(date, num)
      lists << list
    end
    return lists
  end

  def get_group_list(date, num)
    Reservation.where(park_num: num).where(
      start_datetime: date.beginning_of_day..date.end_of_day).or(
      Reservation.where(park_num: num).where(end_datetime: date.beginning_of_day..date.end_of_day)
      )
  end

  def check_reservation(lists, date, hour)
    if !lists.empty?
      lists.each do |reserv|
        result = (date + hour.hour).between?(reserv[:start_datetime], reserv[:end_datetime])
        return result if result == true
      end
    end
    return false
  end

  def check_overbooking(lists, record)
    list = lists[record[:park_num] - 1]
    check_hour = record[:start_datetime]
    while check_hour < record[:end_datetime]
      list.each do |reserv|
        result = check_hour.between?(reserv[:start_datetime], reserv[:end_datetime])
        return false if result == true
      end
      check_hour += 1.hour
    end
    return true
  end
end