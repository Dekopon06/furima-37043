class PurchasesController < ApplicationController

 def index
    @purchase = Order.new
    @items = Item.find(params[:item_id])
    
    # @purchases = Purchase.includes(:item).find(params[:id])
    # @user = User.includes(:prototypes).find(params[:id])
 end

 def create
  # binding.pry
   @purchase = Order.new(purchase_params)
   @items = Item.find(params[:item_id])


   if @purchase.valid?
      @purchase.save
      pay_item
      redirect_to root_path
   else
      render :index
   end
 end
   


 private

 def purchase_params
  params.require(:order).permit(:code, :prefecture_id, :town, :address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
 end

 def pay_item
   Payjp.api_key = "sk_test_d6bf320d6656b5a4d8f5f9c4" 
   Payjp::Charge.create(
   amount: @items.price,  # 商品の値段
   card: purchase_params[:token],    # カードトークン
   currency: 'jpy'                 # 通貨の種類（日本円）
   )
 end


end
