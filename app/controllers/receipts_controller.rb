class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.all
  end

  def create
    @receipt = Receipt.new(receipt_params)

    if @receipt.save
      render json: @receipt
    else
      render json: @receipt.errors, status: :unprocessable_entity
    end
  end

  private

  def receipt_params
    params.require(:receipt).permit(:title, :amount, :date)
  end
end
