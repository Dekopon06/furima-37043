class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item

  # バリデーションの設定
  validates :price, presence: true
end
