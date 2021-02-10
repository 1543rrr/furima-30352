require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)  # Userのインスタンス生成
    end
    it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do # 7~9 全て正常
      expect(@user).to be_valid
    end
    it ' ニックネームが必須であること' do
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'fjghjbljftyu'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること' do
      @user.password = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること' do    # "パスワードは、6文字以上での入力が必須であること"
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'AAA'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it 'パスワードは、確認用を含めて2回入力が必須であること' do  # パスワードは、確認用を含めて2回入力すること
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
      # @user.password = "sdfiusehfskjf"←この行を含めてもテストは通ることを証明するためにコメントアウトを残しています
      @user.password_confirmation = 'uuiudgud'
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it 'first_nameが必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが必須であること' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_name_kanaが必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'last_name_kanaが必須であること' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'birthdayが必須であること' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    it 'passwordは数字のみでは登録できないこと' do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは全角では登録できないこと' do
      @user.password = 'ABC'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'first_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name = 'test123'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.last_name = 'test123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_name_kanaは全角カタカナ以外では登録できないこと' do
      @user.first_name_kana = 'test1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'last_name_kanaは全角カタカナ以外では登録できないこと' do
      @user.last_name_kana = 'test1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
  end
end
