require 'rails_helper'

RSpec.describe Certificate, type: :model do
  before do
    @certificate = FactoryBot.build(:certificate)
  end

  describe '許可証申請の新規作成' do
    context '新規保存できるとき' do
      it 'すべての項目が正しく存在すれば保存できる' do
        expect(@certificate).to be_valid
      end
    end
    context '保存できないとき' do
      it 'building_numが空だと保存できない' do
        @certificate.building_num = ''
        @certificate.valid?
        expect(@certificate.errors.full_messages).to include '棟番号を入力してください'
      end
      it 'room_numが空だと保存できない' do
        @certificate.room_num = ''
        @certificate.valid?
        expect(@certificate.errors.full_messages).to include '部屋番号を入力してください'
      end
      it 'destinationが空だと保存できない' do
        @certificate.destination = ''
        @certificate.valid?
        expect(@certificate.errors.full_messages).to include '訪問先を入力してください'
      end
      it 'car_modelが空だと保存できない' do
        @certificate.car_model = ''
        @certificate.valid?
        expect(@certificate.errors.full_messages).to include '使用車輌（車種）を入力してください'
      end
      it 'license_numが空だと保存できない' do
        @certificate.license_num = ''
        @certificate.valid?
        expect(@certificate.errors.full_messages).to include '車輌登録番号を入力してください'
      end
      it 'drivers_nameが空だと保存できない' do
        @certificate.drivers_name = ''
        @certificate.valid?
        expect(@certificate.errors.full_messages).to include '使用者氏名を入力してください'
      end
      it 'reservationが存在しないと保存できない' do
        @certificate.reservation = nil
        @certificate.valid?
        expect(@certificate.errors.full_messages).to include 'Reservationを入力してください'
      end
    end
  end
end
