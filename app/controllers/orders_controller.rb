class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.valid?
        @order.pack!
        format.html { render action: 'show', notice: 'Order was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:box, items: [:number, :name, :counter])
  end

end
