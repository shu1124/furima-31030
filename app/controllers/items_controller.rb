class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :text, :fee, :user, :category_id, :status_id,
                                 :delivery_fee_id, :delivery_date_id, :prefectures_id, :image).merge(user_id: current_user.id)
  end
end
