class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  # バリデーションの設定
  validates :encrypted_password,:password_confirmation,length:{minimum:6},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}, presence: true
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true 
  validates :first_name, presence: true, format:{with: /\A[一-龥ぁ-ん]/}
  validates :family_name, presence: true, format:{with: /\A[一-龥ぁ-ん]/}
  validates :first_furigana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/}
  validates :family_furigana, presence: true, format:{with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true

end
