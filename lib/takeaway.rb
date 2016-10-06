require_relative 'order'
require_relative 'menu'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu: nil, order: nil)
    @menu = menu
    @order = order || Order.new(menu)
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
    "Your order total is £%.2f" % order.total
  end

end
