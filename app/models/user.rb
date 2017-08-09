class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts
  # attr_writer :current_cart
  has_one :current_cart, :class_name => 'Cart'


  # def current_cart
  #   if self.carts.last.present? && self.carts.last.status == "open" #cart exists and is open
  #     self.carts.last
  #   elsif !self.carts.last.present? #new user with no open or closed carts
  #     self.carts.create(status: "open")
  #   elsif self.carts.last.status == "submitted" #the last cart is already closed
  #     nil
  #   else
  #     self.carts.new(status: "open") # In process of checking out but haven't yet set to submitted.
  #   end
  # end

end
