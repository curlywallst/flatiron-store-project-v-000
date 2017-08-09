class CartsController < ApplicationController


  def show

  end

  def checkout
    cart = current_user.current_cart
    cart.status = "submitted"
    cart.save
    cart.line_items.each do |i|
      item = Item.find(i.item_id)
      item.inventory -= i.quantity
      item.save
    end
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(cart)
  end

end
