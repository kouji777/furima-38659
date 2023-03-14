class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @purchase_record_form = Purchase_recordForm.new
  end

  def create
    @purchase_record_form = Purchase_recordForm.new(purchase_record_params)
    if @purchase_record_form.valid?
      pay_item
      @purchase_record_form.save
      redirect_to root_path
    else
      render :index
    end
  end

end
