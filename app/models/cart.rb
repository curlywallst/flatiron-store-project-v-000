class Cart < ActiveRecord::Base
  has_many :line_items, foreign_key: "cart_id"
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
    line_item = self.line_items.find_by(:item_id => item_id.to_i)
    if line_item
      line_item.quantity +=1
    else
      line_item = self.line_items.build(item_id: item_id.to_i)
    end
    line_item
  end

end
