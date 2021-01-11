class Order
  attr_reader :menu, :dishes

  def initialize(menu)
    @menu = menu
    @dishes = {}
  end

  def add(dish, quantity)
    raise "#{dish.capitalize} not on the menu please try again" unless menu.has_dish?(dish)

    dishes[dish] = quantity
  end

  def total
    items_total.sum
  end

  private

  def items_total
    dishes.map { |dish, quantity|
      menu.price(dish) * quantity
    }
  end
end
