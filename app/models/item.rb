class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :detail
  belongs_to :charge
  belongs_to :shipp
  belongs_to :prefecture

  # バリデーションの設定
  validates :image, presence: true
  validates :item_name, presence: true
  validates :explain, presence: true
  validates :category_id, presence: true
  validates :detail_id, presence: true
  validates :charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipp_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :detail_id, :charge_id, :prefecture_id, :shipp_id,numericality: { other_than: 0 }
end