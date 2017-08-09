class LineItemsController < ApplicationController

  def create
    if current_user.current_cart.nil? || current_user.current_cart.status == "submitted" # creating a line item for a new cart that doesn't exist yet
     current_user.current_cart = Cart.create(user_id: current_user.id, status: 'open')
    end
    line_item = current_user.current_cart.add_item(params[:item_id])
    line_item.save
    current_user.current_cart.save
    redirect_to cart_path(current_user.current_cart)
  end

end
