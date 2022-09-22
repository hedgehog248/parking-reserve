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
  NAME_REGEX_MSG = 'is invalid. Input full-width characters'.freeze

  with_options presence: true, format: {with: NAME_REGEX, message: NAME_REGEX_MSG} do
    validates :last_name
    validates :first_name
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  PASSWORD_REGEX_MSG = 'is invalid. Include both alphabetical and numeric characters'
  validates_format_of :password, with: PASSWORD_REGEX, message: PASSWORD_REGEX_MSG
end
