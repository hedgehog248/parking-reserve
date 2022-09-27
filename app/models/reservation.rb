class Reservation < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :park_num
    validates :start_datetime
    validates :end_datetime
  end
end
