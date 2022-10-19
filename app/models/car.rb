class Car < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :nickname
    validates :model
    validates :license_num
  end
end
