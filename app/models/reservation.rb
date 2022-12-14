class Reservation < ApplicationRecord
  require 'active_support/all'
  include ReservationsHelper

  belongs_to :user
  has_one    :certificate, dependent: :destroy

  with_options presence: true do
    validates :park_num
    validates :start_datetime
    validates :end_datetime
  end

  validate :s_time_open_check
  validate :s_time_deadline_check
  validate :e_time_open_check
  validate :e_time_deadline_check
  validate :check_overbooking
  validate :count_reserv_below_three

  private

  def s_time_open_check
    s_time_open = (DateTime.current + 1.hour).beginning_of_hour
    errors.add(:start_datetime, 'は現在の日時より後を選択してください。') if start_datetime.present? && start_datetime < s_time_open
  end

  def s_time_deadline_check
    s_time_deadline = DateTime.current.next_month.end_of_month
    errors.add(:start_datetime, 'がまだ予約できない期間になっています。') if start_datetime.present? && start_datetime > s_time_deadline
  end

  def e_time_open_check
    if start_datetime.present? && end_datetime.present? && end_datetime <= start_datetime
      errors.add(:end_datetime, 'は開始日時より後を選択してください。')
    end
  end

  def e_time_deadline_check
    e_time_deadline = start_datetime + 24.hours if start_datetime.present?
    if end_datetime.present? && e_time_deadline.present? && end_datetime >= e_time_deadline
      errors.add(:end_datetime, 'は開始日時の24時間以内を選択してください。')
    end
  end

  def check_overbooking
    if start_datetime.present? && end_datetime.present?
      list = get_group_list(start_datetime, park_num)
      check_hour = start_datetime
      flag = 0
      while check_hour < end_datetime
        list.each do |reserv|
          result = check_hour.between?(reserv[:start_datetime], reserv[:end_datetime])
          flag += 1 if result == true
        end
        check_hour += 1.hour
      end
      if flag.positive?
        errors.add(:base, :invalid, message: '指定の日時には既に他の予約が入っています。変更してください。')
        false
      else
        true
      end
    end
  end

  def count_reserv_below_three
    valid_reserv = Reservation.where('end_datetime > ?', DateTime.current).where('user_id = ?', user_id)
    errors.add(:base, :invalid, message: '既に3件の予約があります。一度にとれる予約は3つまでです。') if valid_reserv.length >= 3
  end
end
