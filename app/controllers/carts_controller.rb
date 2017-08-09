class CartsController < ApplicationController


  def show

  end

  def checkout
    cart = current_user.carts.last
    cart.status = "submitted"
    cart.save
    cart.line_items.each do |i|
      item = Item.find(i.item_id)
      item.inventory -= i.quantity
      item.save
    end
    current_user.current_cart = nil

    redirect_to cart_path(cart)
  end

end
