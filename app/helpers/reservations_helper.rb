module ReservationsHelper

  # 抜き出した予約データを駐車場番号ごとに配列に並べる
  def get_all_list(date)
    lists = []
    (1..4).each do |num|
      list = get_group_list(date, num)
      lists << list
    end
    lists
  end

  # 指定した駐車場番号で開始時間と終了時間のどちらかが指定日に入っている予約を抜き出す
  def get_group_list(date, num)
    Reservation.where(park_num: num).where(
      start_datetime: date.beginning_of_day..date.end_of_day
    ).or(
      Reservation.where(park_num: num).where(
        end_datetime: date.beginning_of_day..date.end_of_day
      )
    )
  end

  def check_reservation(lists, date, hour)
    unless lists.empty?                       # リストが空でなければ処理を実行
      lists.each do |reserv|
        result = (date + hour.hour).between?( # チェックするセルの時間が予約と重なるか
                  reserv[:start_datetime], 
                  reserv[:end_datetime]
                  )
        return result if result == true       # 重なっていればtrueを返す
      end
    end
    return false                              # リストが空か重なりがなければfalse
  end
end
