FactoryBot.define do
  factory :car do
    nickname { Faker::Name.name }
    model { Faker::Vehicle.make_and_model }
    license_num { Faker::Vehicle.license_plate }
    association :user
  end
end
