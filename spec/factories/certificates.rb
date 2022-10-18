FactoryBot.define do
  factory :certificate do
    building_num { '11' }
    room_num { '201' }
    destination { '佐藤一郎' }
    car_model { Faker::Vehicle.make_and_model }
    license_num { Faker::Vehicle.license_plate }
    drivers_name { '高橋' }
    association :reservation
  end
end
