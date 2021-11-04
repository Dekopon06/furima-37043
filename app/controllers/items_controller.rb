class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.order("created_at DESC")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :image, :explain, :category_id, :detail_id, :change_id, :prefecture_id, :shipp_id, :price )
  end

end
