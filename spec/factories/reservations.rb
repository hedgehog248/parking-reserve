FactoryBot.define do
  factory :reservation do
    park_num       { rand(1..4) }
    start_datetime { (Time.current + 2.hour).beginning_of_hour }
    end_datetime   { (start_datetime + rand(24).hour).end_of_hour }
    association :user
  end
end
