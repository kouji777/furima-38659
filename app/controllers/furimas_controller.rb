class FurimasController < ApplicationController
 
 before_action :authenticate_user!, except: [:index, :show]
 
  def new
    @product = Product.new
  end

  def creste
    @product = Product.new(product_params)
    if @product.save
      rediret_to root_path
    else
      render :new
    end
  end
end
