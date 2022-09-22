FactoryBot.define do
  factory :user do
    building_num          {'10'}
    room_num              {'101'}
    last_name             {'田中'}
    first_name            {'太郎'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Alphanumeric.alphanumeric(number: 8, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
  end
end
