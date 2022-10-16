class Certificate < ApplicationRecord
  belongs_to :reservation
  has_one_attached :pdf

  with_options presence: true do
    validates :building_num
    validates :room_num
    validates :destination
    validates :car_model
    validates :license_num
    validates :drivers_name
  end
end
