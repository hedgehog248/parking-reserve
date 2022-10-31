User.create!(
  building_num:          "管理事務所",
  room_num:              "000",
  last_name:             "管理人",
  first_name:            "管理人",
  email:                 ENV['ADMIN_EMAIL'],
  password:              ENV['ADMIN_PASSWORD'],
  password_confirmation: ENV['ADMIN_PASSWORD'],
  admin:                 true
)
