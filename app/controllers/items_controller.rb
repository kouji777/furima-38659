class ItemsController < ApplicationController
 
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

 
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def creste
    @item = Item.new(item_params)
    if @item.save
      rediret_to root_path
    else
      render :new
    end
  end
  
end
