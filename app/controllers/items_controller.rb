class ItemsController < ApplicationController

  def index
    @receipt = Receipt.find(params[:receipt_id])
    render json: @receipt.items
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def create
    receipt = Receipt.find(params[:receipt_id])
    create_params = params.require(:item).permit(:name)

    @item = receipt.items.create(create_params)
    @item.save!

    render json: @item
  end

  def update
    @item = Item.find(params[:pk])

    update_params = { params[:name] => params[:value]}
    @item.update(update_params)

    render json: @item
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy!

    render :nothing=> true, :status => :ok
  end
end
