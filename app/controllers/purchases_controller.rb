class PurchasesController < ApplicationController

 def index
    @purchase = Order.new
    @items = Item.find(params[:item_id])
    
    # @purchases = Purchase.includes(:item).find(params[:id])
    # @user = User.includes(:prototypes).find(params[:id])
 end

 def create
   @purchase = Order.new(purchase_params)
  #  @shipping = Order.new(purchase_params)
  #  Shipping.create(shipping_params)

   if @purchase.save
   redirect_to root_path
     
   else
    render :index
   end
 end
   


 private

 def purchase_params
  params.require(:order).permit(:code, :prefecture_id, :town, :address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
 end

end
