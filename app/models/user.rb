class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :building_num
    validates :room_num, uniqueness: { scope: :building_num }
  end

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  NAME_REGEX_MSG = 'is invalid. Input full-width characters.'.freeze

  with_options presence: true, format: {with: NAME_REGEX, message: NAME_REGEX_MSG} do
    validates :last_name
    validates :first_name
  end
end
