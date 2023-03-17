class ItemsController < ApplicationController
 
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_item, only: [:show]
  
  def index
    @items = Item.purchase_record('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :item_condition_id, :cost_id, :prefecture_id, :shipment_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end