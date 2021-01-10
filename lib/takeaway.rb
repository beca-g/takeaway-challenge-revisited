class Takeaway
  attr_reader :menu, :order

  def initialize(menu, order)
    @menu = menu
    @order = order || Order.new(menu)
  end

  def view_menu
    menu.view
  end

  def place_order(dishes)
    dishes.map { |dish, quantity|
      order.add(dish, quantity)
    }
  end
end
