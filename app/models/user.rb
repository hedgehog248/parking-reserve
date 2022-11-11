class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy
  has_many :cars, dependent: :destroy
  belongs_to :building_num
  belongs_to :room_num

  with_options presence: true do
    validates :building_num_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :room_num_id, uniqueness: { scope: :building_num_id },  numericality: { other_than: 0, message: "can't be blank" }
  end

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  NAME_REGEX_MSG = 'は全角文字（漢字・ひらがな・カタカナ）を使用してください。再入力をお願いします。'.freeze
  with_options presence: true, format: { with: NAME_REGEX, message: NAME_REGEX_MSG } do
    validates :last_name
    validates :first_name
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  PASSWORD_REGEX_MSG = 'には英字と数字をそれぞれ1文字以上含めるようにしてください。再入力をお願いします。'.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: PASSWORD_REGEX_MSG, if: :password_required?

  # 更新時に現在のpasswordを不要にする
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    # passwordとpassword_confirmationが空の場合、passwordの更新はされずに情報を更新する
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end
end
