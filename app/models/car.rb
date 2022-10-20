class Car < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :nickname
    validates :model
    validates :license_num
    validates :drivers_name
  end
end
