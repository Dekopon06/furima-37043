class PurchasesController < ApplicationController
  before_action :authenticate_user!
  
 def index
    @purchase = Order.new
    item_info 
    
   if current_user == @items.user || @items.purchase != nil
      redirect_to root_path
   end
 end

 def create
   @purchase = Order.new(purchase_params)
   item_info 


   if @purchase.valid?
      @purchase.save
      pay_item
      redirect_to root_path
   else
      render :index
   end
 end
   


 private

 def item_info
  @items = Item.find(params[:item_id])
 end

 def purchase_params
  params.require(:order).permit(:code, :prefecture_id, :town, :address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
 end

 def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
   Payjp::Charge.create(
   amount: @items.price,  # 商品の値段
   card: purchase_params[:token],    # カードトークン
   currency: 'jpy'                 # 通貨の種類（日本円）
   )
 end


end
