class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order_item = OrderItem.new(order_params)
    if @order_item.valid?
      @order_item.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  def order_params
    params.permit(:postal_code,:city,:area,:building,:prefecture_id,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end
