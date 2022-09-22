require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '利用者（一般ユーザー）新規登録' do
    context '登録できるとき' do
      it '全項目が正しく存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '登録できないとき' do
      it 'building_numが空だと登録できない' do
        @user.building_num = ""
        @user.valid?
        expect(@user.errors.full_messages).to include '棟番号を入力してください'
      end
      it 'room_numが空だと登録できない' do
        @user.room_num = ""
        @user.valid?
        expect(@user.errors.full_messages).to include '部屋番号を入力してください'
      end
      it 'building_numとroom_numが同じパターンのユーザーが既に存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.valid?
        expect(another_user.errors.full_messages).to include '部屋番号はすでに存在します'
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include '姓を入力してください'
      end
      it 'last_nameが半角だと登録できない' do
        @user.last_name = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include '姓は全角文字（漢字・ひらがな・カタカナ）を使用してください。再入力をお願いします。'
      end
      it 'last_nameが全角数字だと登録できない' do
        @user.last_name = "１２３４"
        @user.valid?
        expect(@user.errors.full_messages).to include '姓は全角文字（漢字・ひらがな・カタカナ）を使用してください。再入力をお願いします。'
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include '名を入力してください'
      end
      it 'first_nameが半角だと登録できない' do
        @user.first_name = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include '名は全角文字（漢字・ひらがな・カタカナ）を使用してください。再入力をお願いします。'
      end
      it 'first_nameが全角数字だと登録できない' do
        @user.first_name = "１２３４"
        @user.valid?
        expect(@user.errors.full_messages).to include '名は全角文字（漢字・ひらがな・カタカナ）を使用してください。再入力をお願いします。'
      end
      it 'emailが空だと登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールを入力してください'
      end
      it 'emailに@が含まれないと登録できない' do
        @user.email = "testmail"
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it 'emailが重複するユーザーが既に存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email, room_num: '102')
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Eメールはすでに存在します'
      end
      it 'passwordが空だと登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードを入力してください'
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = "abc123"
        @user.password_confirmation = "abc1234"
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = "abc12"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
      it 'passwordが129文字以上だと登録できない' do
        @user.password = Faker::Alphanumeric.alphanumeric(number: 129, min_alpha: 1, min_numeric: 1)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは128文字以内で入力してください'
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードには英字と数字をそれぞれ1文字以上含めるようにしてください。再入力をお願いします。'
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = "abcdef"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードには英字と数字をそれぞれ1文字以上含めるようにしてください。再入力をお願いします。'

      end
      it 'passwordが全角文字では登録できない' do
        @user.password = "あかさたなは"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードには英字と数字をそれぞれ1文字以上含めるようにしてください。再入力をお願いします。'

      end
    end
  end
end
