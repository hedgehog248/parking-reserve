class Certificate < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :reservation
  belongs_to :building_num
  belongs_to :room_num
  has_one_attached :pdf

  with_options presence: true do
    validates :building_num_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :room_num_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :destination
    validates :car_model
    validates :license_num
    validates :drivers_name
  end
end
