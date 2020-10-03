class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :sold_out
  before_action :set_item

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private 
   def purchase_params
    params.require(:purchase_address).permit(:postal_code, :city, :number,:building,:phone_number,:prefectures_id).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
   end 

   def set_item
    @item = Item.find(params[:item_id])
   end

   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).fee,
      card: purchase_params[:token],
      currency: 'jpy'
    )
   end

   def move_to_index
      if user_signed_in? && current_user.id == Item.find(params[:item_id]).user.id
        redirect_to root_path
      end
   end

   def sold_out
      if Purchase.exists?(item_id: params[:item_id])
        redirect_to root_path
      end
   end
end
