class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image
# has_one :purchase

  include ActiveHash::Associations
  has_many  :categorys
  has_many  :details
  has_many  :changes
  has_many  :shipps
  has_many  :prefectures 


  # バリデーションの設定
  validates :item_name, presence: true
  validates :explain, presence: true
  validates :category_id, presence: true
  validates :detail_id, presence: true
  validates :change_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipp_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }, merge(user_id: current_user.id)

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
end