class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  # before_action :set_item, only: [:new, :create]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
      @item = Item.find(params[:id])
  end
  

  private

  def item_params
    params.require(:item).permit(:name, :content, :image, :description, :detail_id, :regarding_delivery_id, :selling_price_id,
                                 :category_id, :prefecture_id, :value, :user).merge(user_id: current_user.id)
  end

  
end