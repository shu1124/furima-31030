class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    binding.pry
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end


  private 
   def purchase_params
    params.require(:purchase_address).permit(:postal_code, :city, :number,:building,:phone_number,:prefectures_id).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
   end 

   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).fee,
      card: purchase_params[:token],
      currency: 'jpy'
    )
   end
end
