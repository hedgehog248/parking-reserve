require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before do
    @reservation = FactoryBot.build(:reservation)
  end

  describe '新規予約登録' do
    context '予約できるとき' do
      it 'すべての値が正しく存在すれば登録できる' do
        expect(@reservation).to be_valid
      end
    end

    context '予約できないとき' do
      it 'park_numが空だと登録できない' do
        @reservation.park_num = ''
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include "駐車場番号を入力してください"
      end
      it 'start_datetimeが空だと登録できない' do
        @reservation.start_datetime = ''
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include "開始日時を入力してください"
      end
      it 'start_timeは現在時刻以降(xx時00分)でないと登録できない' do
        @reservation.start_datetime = Time.current
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include "開始日時は現在の日時より後を選択してください。"
      end
      it 'start_timeが現在の翌月末日以降では登録できない' do
        @reservation.start_datetime = Time.current.beginning_of_month + 2.month
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include "開始日時がまだ予約できない期間になっています。"
      end
      it 'end_datetimeが空だと登録できない' do
        @reservation.end_datetime = ''
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include "終了日時を入力してください"        
      end
      it 'end_timeはstart_time以降(xx時59分)でないと登録できない' do
        @reservation.end_datetime = @reservation.start_datetime
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include "終了日時は開始日時より後を選択してください。"
      end
      it 'end_timeはstart_timeの24時間以内でないと登録できない' do
        @reservation.end_datetime = @reservation.start_datetime + 24.hour
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include "終了日時は開始日時の24時間以内を選択してください。"
      end

      it '同駐車場・同時間枠に既に予約がある場合は予約ができない' do
        @reservation.save
        another_reserv = FactoryBot.build(:reservation)
        another_reserv.park_num = @reservation.park_num
        another_reserv.start_datetime = @reservation.start_datetime
        another_reserv.end_datetime = another_reserv.start_datetime.end_of_hour
        another_reserv.valid?
        expect(another_reserv.errors.full_messages).to include "指定の日時には既に他の予約が入っています。変更してください。"
      end

      it '同一userによる未消化の予約が既に3件あると登録できない' do
        @reservation.park_num = 1
        @reservation.save
        second_reserv = FactoryBot.create(:reservation, park_num: 2, user_id: @reservation.user_id)
        third_reserv = FactoryBot.create(:reservation, park_num: 3, user_id: @reservation.user_id)
        fourth_reserv = FactoryBot.build(:reservation, park_num: 4, user_id: @reservation.user_id)
        fourth_reserv.valid?
        expect(fourth_reserv.errors.full_messages).to include "既に3件の予約があります。一度にとれる予約は3つまでです。"
      end
      it 'userが存在しないと登録できない' do
        @reservation.user = nil
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include "Userを入力してください"
      end
    end
  end
end
