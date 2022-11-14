User.create!(
  building_num_id:       9,
  room_num_id:           41,
  last_name:             "管理人",
  first_name:            "管理人",
  email:                 ENV['ADMIN_EMAIL'],
  password:              ENV['ADMIN_PASSWORD'],
  password_confirmation: ENV['ADMIN_PASSWORD'],
  admin:                 true
)

User.create!(
  building_num_id:       1,
  room_num_id:           1,
  last_name:             "てすと",
  first_name:            "一郎",
  email:                 "test@user",
  password:              "test1234",
  password_confirmation: "test1234",
  admin:                 false
)

Car.create!(
  nickname:       "息子の車",
  model:          "TOYOTA プリウス",
  license_num:    "習志野あ 00-00",
  drivers_name:   "てすと 三郎",
  user_id:        2,
)
