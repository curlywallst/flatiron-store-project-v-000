class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts
  attr_writer :current_cart


  def current_cart
    if self.carts.last.present? && self.carts.last.status == "open"
      self.carts.last
    elsif !self.carts.last.present?
      self.carts.create(status: "open")
      self.save
      self.carts.last
    elsif self.carts.last.status == "submitted"
      nil
    else
      self.carts.new(status: "open")
    end
  end

end
