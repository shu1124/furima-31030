class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: :edit

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
     if @item.destroy
      redirect_to root_path
     else
      render :show
     end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user.id
  end

  def items_params
    params.require(:item).permit(:name, :text, :fee, :user, :category_id, :status_id,
                                 :delivery_fee_id, :delivery_date_id, :prefectures_id, :image).merge(user_id: current_user.id)
  end
end
