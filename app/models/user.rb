class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders
  
  with_options presence: true do
  #validates :birth_day, presence: true ←修正があった場合、元の記述が何か示す為
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  validates :birth_day
  validates :nickname
  validates :password_confirmation
  
  validates :first_name_kana, :last_name_kana,
                format: {
                  with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                  message: "全角カタカナのみで入力して下さい"
                }
  validates :first_name, :last_name,
                format: {
                  with: /\A[ぁ-んァ-ン一-龥々]/,
                  message: "は全角（漢字・ひらがな・カタカナ）での入力が必須であること"
                }

  end 
end


 