class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :code, :town, :address, :building, :telephone, :prefecture_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
   validates :item_id
   validates :code
   validates :address
   validates :town
   validates :telephone
   validates :prefecture_id
   validates :purchase_id, numericality: { other_than: 0 }
   validates :token
  end

  # 各テーブルにデータを保存する処理を書く
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id )
    # binding.pry
    shipping = Shipping.create(code: code, town: town, address: address, building: building, telephone: telephone, prefecture_id: prefecture_id, purchase_id: purchase.id )
  end

end