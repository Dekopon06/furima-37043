class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase

  # バリデーションの設定
  validates :item_name, presence: true
  validates :explain, presence: true
  validates :category_id, presence: true
  validates :detail_id, presence: true
  validates :change_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipp_id, presence: true
  validates :price, presence: true

end
