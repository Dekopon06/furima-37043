class PurchasesController < ApplicationController

 def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
    
    # @purchases = Purchase.includes(:item).find(params[:id])
    # @user = User.includes(:prototypes).find(params[:id])
 end

 def create
   @purchase = Purchase.new(purchase_params)

   if @purchase.save
      redirect_to root_path
   else
     render 'index'
   end
 end

private

def purchase_params
  params.permit(:item_id, :user_id)
  #.permit(:).merge(user_id: current_user.id)
end

end
