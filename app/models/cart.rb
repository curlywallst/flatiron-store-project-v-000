class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    @total = 0
    self.line_items.each do |i|
      @total += i.item.price * i.quantity
    end
    @total
  end

  def add_item(item_id)
    @current_cart = self
    if !@current_cart.items.include?(Item.find(item_id))
      line_item = @current_cart.line_items.new(item_id: item_id)
    else
      line_item = @current_cart.line_items.find_by(:item_id => item_id)
      line_item.quantity +=1
      @current_cart.save
    end
    line_item
  end



end
