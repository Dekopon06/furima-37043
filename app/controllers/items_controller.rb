class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :image, :explain, :category_id, :detail_id, :change_id, :prefecture_id, :shipp_id, :price )
  end

end
