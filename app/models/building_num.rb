class BuildingNum < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '10号棟' },
    { id: 2, name: '11号棟' },
    { id: 3, name: '12号棟' },
    { id: 4, name: '13号棟' },
    { id: 5, name: '14号棟' },
    { id: 6, name: '15号棟' },
    { id: 7, name: '16号棟' },
    { id: 8, name: '17号棟' },
    { id: 9, name: '管理事務所' }
  ]

  include ActiveHash::Associations
  has_many :users
  has_many :certificates

end
