class Shipping < ApplicationRecord
  belongs_to :purchase

  # バリデーションの設定

  
  # validates :prefecture_id, presence: true
  # validates :prefecture_id, numericality: { other_than: 0 }

end
