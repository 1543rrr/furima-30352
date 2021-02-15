class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :redirect_to_show, only:[:edit]
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

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    
    if @item.update(item_params)
       redirect_to item_path(@item)
     else
    render :edit
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

  def redirect_to_show
    @item = Item.find(params[:id])
    return redirect_to root_path if current_user.id != @item.user.id
  end
  
end