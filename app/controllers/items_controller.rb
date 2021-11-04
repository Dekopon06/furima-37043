class ItemsController < ApplicationController

  def index
  end

  def new
     @item = Item.order("created_at DESC")
     @items = Item.new
   unless user_signed_in? && current_user.id
     redirect_to  new_user_registration_path
   end

  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :image, :explain, :category_id, :detail_id, :charge_id, :prefecture_id, :shipp_id, :price ).merge(user_id: current_user.id)
  end

end
