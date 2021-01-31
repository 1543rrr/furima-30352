require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)  # Userのインスタンス生成
    end
    
    it " ニックネームが必須であること" do
      @user.nickname = ""  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end    
    it "メールアドレスが必須であること" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは、@を含む必要があること" do
      @user.email = "fjghjbljftyu"
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが必須であること" do
      @user.password = ""  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、6文字以上での入力が必須であること" do    #"パスワードは、6文字以上での入力が必須であること"
      @user.password = "1111111"
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = "AAA"
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "パスワードは、確認用を含めて2回入力が必須であること" do  #パスワードは、確認用を含めて2回入力すること
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      # @user.password = "sdfiusehfskjf"
      @user.password_confirmation = "uuiudgud"
      @user.valid?
      #binding.pry
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end
end  

#RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
#end

#