class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  # has_many :purchases

  # バリデーションの設定
  validates :password, presence: true, format:{with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}+\z/i}
  # validates :encrypted_password,:password_confirmation,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}, presence: true
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true 
  validates :first_name, presence: true, format:{with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :family_name, presence: true, format:{with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_furigana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/}
  validates :family_furigana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true

end
