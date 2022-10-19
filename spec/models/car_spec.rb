require 'rails_helper'

RSpec.describe Car, type: :model do
  before do
    @car = FactoryBot.build(:car)
  end

  describe '車輌情報の新規登録' do
    context '新規登録できるとき' do
      it 'すべての項目が正しく存在すれば保存できる' do
        expect(@car).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空だと保存できない' do
        @car.nickname = ''
        @car.valid?
        expect(@car.errors.full_messages).to include "識別用ニックネームを入力してください"
      end
      it 'modelが空だと保存できない' do
        @car.model = ''
        @car.valid?
        expect(@car.errors.full_messages).to include "使用車輌(車種)を入力してください"
      end
      it 'license_numが空だと保存できない' do
        @car.license_num = ''
        @car.valid?
        expect(@car.errors.full_messages).to include "車輌登録番号を入力してください"
      end
      it 'userが紐付いていないと保存できない' do
        @car.user = nil
        @car.valid?
        expect(@car.errors.full_messages).to include "Userを入力してください"
      end
    end
  end
end
