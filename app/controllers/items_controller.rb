class ItemsController < ApplicationController

  before_action :authenticate_user!, only:[:new]

  def index
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

  private
  def item_params
    params.require(:item).permit(:name,:content,:price,:image,:category_id,:condition_id,:fee_id,:area_id,:send_id).merge(user_id: params[:user_id])
  end
end
