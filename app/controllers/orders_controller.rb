class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_id
  before_action :already_sold

  def index
    @order_item = OrderItem.new
  end

  def create
    @order_item = OrderItem.new(order_params)
    if @order_item.valid?
      pay_jpy
      @order_item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_item).permit(:postal_code, :city, :area, :building, :prefecture_id, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def already_sold
    if Order.exists?(item_id: @item.id) || current_user.id == @item.user_id
      redirect_to root_path
    end 
  end

  def pay_jpy
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item_id
    @item = Item.find(params[:item_id])
  end

end
