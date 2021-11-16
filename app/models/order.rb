class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :code, :town, :address, :building, :telephone, :token, :prefecture_id

with_options presence: true do
  validates :item_id
  validates :user_id
  validates :code, format:{with: /\A\d{3}[-]\d{4}+\z/}
  validates :address
  validates :town
  validates :telephone, presence: true, format:{with: /\A\d{10,11}\z/}
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :token
end
 
# 各テーブルにデータを保存する処理を書く
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id )
    shipping = Shipping.create(code: code, town: town, address: address, building: building, telephone: telephone, prefecture_id: prefecture_id, purchase_id: purchase.id )
  end

end