require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    sleep 0.1
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
  end

 describe '商品出品機能' do

  context '内容に問題ない場合' do

    it "必要な要素が全てあれば保存ができること" do
      expect(@order).to be_valid
    end

    it "建物名が抜けていても登録できること" do
      @order.building = ''
      expect(@order).to be_valid
    end

  end

  context '内容に問題がある場合' do

    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it "郵便番号が必須であること" do
      @order.code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "Code can't be blank"
    end

    it "郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと" do
      @order.code = '1111-111'
      @order.valid?
      expect(@order.errors.full_messages).to include "Code is invalid"
    end

    it "都道府県が必須であること" do
      @order.prefecture_id = 0
      @order.valid?
      expect(@order.errors.full_messages).to include "Prefecture must be other than 0"
    end

    it "市区町村が必須であること" do
      @order.town = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "Town can't be blank"
    end

    it "番地が必須であること" do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "Address can't be blank"
    end

    it "電話番号が必須であること" do
      @order.telephone = ''
      @order.valid?
      expect(@order.errors.full_messages).to include "Telephone can't be blank"
    end

    it "電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと" do
      @order.telephone = '0000000000000'
      @order.valid?
      expect(@order.errors.full_messages).to include "Telephone is invalid"
    end

    it "電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと" do
      @order.telephone = '000000000'
      @order.valid?
      expect(@order.errors.full_messages).to include "Telephone is invalid"
    end

    it "電話番号は、英数混合では登録できないこと" do
      @order.telephone = 'a0A00000000'
      @order.valid?
      expect(@order.errors.full_messages).to include "Telephone is invalid"
    end

    it "userが紐付いていないと登録できない" do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end

    it "itemが紐付いていないと登録できない" do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end

  end
 end
end