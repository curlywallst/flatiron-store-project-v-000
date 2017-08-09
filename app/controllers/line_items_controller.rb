class LineItemsController < ApplicationController

  def create
    @current_cart = current_user.current_cart
    if @current_cart.nil?
      @current_cart = current_user.carts.create(status: "open")
    end
    line_item = current_user.current_cart.add_item(params[:item_id])
    line_item.save
    @current_cart.save
    redirect_to cart_path(current_user.current_cart)
  end


end
