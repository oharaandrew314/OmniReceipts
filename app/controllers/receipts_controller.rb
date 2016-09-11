class ReceiptsController < ApplicationController
  include ReceiptsHelper

  def index
    @receipts = @current_user.receipts
    @stores = stores @current_user

    respond_to do |format|
      format.html
      format.json { render json: @receipts }
    end
  end

  def create
    @receipt = @current_user.receipts.create(receipt_params)
    @receipt.save!

    redirect_to @receipt
  end

  def show
    @receipt = get
  end

  def update
    @receipt = get
    @receipt.update(receipt_params)

    respond_to do |format|
      format.html { redirect_to @receipt }
      format.json { render json: @receipt }
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
