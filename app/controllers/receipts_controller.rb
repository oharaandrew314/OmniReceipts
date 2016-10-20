class ReceiptsController < ApplicationController

  def index
    @receipts = @current_user.receipts

    respond_to do |format|
      format.html
      format.json { render json: @receipts }
    end
  end

  def create
    @receipt = @current_user.receipts.create(receipt_params)
    receipt_image = params.require(:receipt)['image']
    if !receipt_image.nil?
      @receipt.update_image receipt_image
    end
    @receipt.save!

    redirect_to @receipt
  end

  def show
    @receipt = get

    respond_to do |format|
      format.html
      format.json { render json: @receipt }
    end
  end

  def update
    @receipt = get

    @receipt.update(receipt_params)
    receipt_image = params.require(:receipt)['image']
    if !receipt_image.nil?
      @receipt.update_image receipt_image
    end

    redirect_to @receipt
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
      params.require(:receipt).permit(:store, :date)
    end
end
