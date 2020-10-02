class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end


  private 
   def purchase_params
    params.permit(:item_id).merge(token: params[:token],user_id: current_user.id)
   end 

   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @purchase.item.fee, 
      card: purchase_params[:token],
      currency: 'jpy'
    )
   end
end
