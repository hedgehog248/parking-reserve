class Reservation < ApplicationRecord
  require 'active_support/all'

  belongs_to :user

  with_options presence: true do
    validates :park_num
    validates :start_datetime
    validates :end_datetime
  end

  validate :s_time_open_check
  validate :s_time_deadline_check
  validate :e_time_open_check
  validate :e_time_deadline_check

  def s_time_open_check
    s_time_open = (DateTime.current + 1.hour).beginning_of_hour
    errors.add(:start_datetime, 'は現在の日時より後を選択してください。') if start_datetime < s_time_open
  end

  def s_time_deadline_check
    s_time_deadline = DateTime.current.next_month.end_of_month
    errors.add(:start_datetime, 'がまだ予約できない期間になっています。') if start_datetime > s_time_deadline
  end

  def e_time_open_check
    errors.add(:end_datetime, 'は開始日時より後を選択してください。') if end_datetime < start_datetime
  end

  def e_time_deadline_check
    e_time_deadline = start_datetime + 24.hours
    errors.add(:end_datetime, 'は開始日時の24時間以内を選択してください。') if end_datetime >= e_time_deadline
  end
end
