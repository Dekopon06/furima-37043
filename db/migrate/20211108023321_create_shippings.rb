class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :code,     null: false
      t.string     :town,     null: false
      t.string     :address,     null: false
      t.string     :building
      t.string     :telephone,     null: false
      t.integer    :prefecture_id, null: false 
      t.references :purchase,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
