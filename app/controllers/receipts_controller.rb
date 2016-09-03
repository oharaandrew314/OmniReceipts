class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.all
  end

  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(receipt_params)
    @receipt.save!

    redirect_to @receipt
  end

  def show
    @receipt = get
  end

  def update
    @receipt = Receipt.find(params[:pk])
    update_params = { params[:name] => params[:value]}
    if @receipt.update(update_params)
      redirect_to @receipt
    else
      render 'edit'
    end
  end

  def destroy
    @receipt = Receipt.find(params.require(:id))
    @receipt.destroy!

    redirect_to receipts_path
  end

  private
    def get
      Receipt.find(params.require(:id))
    end

    def receipt_params
      params.require(:receipt).permit(:name, :store, :date)
    end

end
