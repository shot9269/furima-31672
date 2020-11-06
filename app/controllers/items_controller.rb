class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:show,:destory]
  before_action :item_id, only: [:show,:edit,:update,:destroy]
  before_action :authorized_user, only: [:edit,:destroy]

  def index
    @items = Item.all.order("created_at DESC")
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
  end

  def edit
  end


  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :condition_id, :fee_id, :area_id, :send_id, :image).merge(user_id: current_user.id)
  end

  def item_id
    @item = Item.find(params[:id])
  end

  def authorized_user
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

end
