class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :edit ]
  before_action :set_message, only: [:show, :edit, :update ]
  def set_message
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.order("created_at DESC")
  end

  def new
     @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render  :new
    end
  end

  def show

  end

  def edit


   unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
   end

  end

  def update

    if @item.update(item_params)
       redirect_to root_path
    else
       render :edit
    end

  end 


  # def destroy
  # end


  private
  def item_params
    params.require(:item).permit(:item_name, :image, :explain, :category_id, :detail_id, :charge_id, :prefecture_id, :shipp_id, :price ).merge(user_id: current_user.id)
  end

end
