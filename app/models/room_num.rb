class RoomNum < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '101号室' },
    { id: 2, name: '102号室' },
    { id: 3, name: '103号室' },
    { id: 4, name: '104号室' },
    { id: 5, name: '105号室' },
    { id: 6, name: '106号室' },
    { id: 7, name: '201号室' },
    { id: 8, name: '202号室' },
    { id: 9, name: '203号室' },
    { id: 10, name: '204号室' },
    { id: 11, name: '205号室' },
    { id: 12, name: '206号室' },
    { id: 13, name: '301号室' },
    { id: 14, name: '302号室' },
    { id: 15, name: '303号室' },
    { id: 16, name: '304号室' },
    { id: 17, name: '305号室' },
    { id: 18, name: '306号室' },
    { id: 19, name: '401号室' },
    { id: 20, name: '402号室' },
    { id: 21, name: '403号室' },
    { id: 22, name: '404号室' },
    { id: 23, name: '405号室' },
    { id: 24, name: '406号室' },
    { id: 25, name: '501号室' },
    { id: 26, name: '502号室' },
    { id: 27, name: '503号室' },
    { id: 28, name: '504号室' },
    { id: 29, name: '505号室' },
    { id: 30, name: '506号室' },
    { id: 31, name: '601号室' },
    { id: 32, name: '602号室' },
    { id: 33, name: '603号室' },
    { id: 34, name: '604号室' },
    { id: 35, name: '701号室' },
    { id: 36, name: '702号室' },
    { id: 37, name: '703号室' },
    { id: 38, name: '704号室' },
    { id: 39, name: '801号室' },
    { id: 40, name: '802号室' },
    { id: 41, name: ''}
  ]

  include ActiveHash::Associations
  has_many :users
  has_many :certificates

end
