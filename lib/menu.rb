class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def view
    dishes.map { |dish, price| 
      "%s £%.2f" % [dish.to_s.capitalize, price]
    }.join(", ")
  end

  def has_dish?(dish)
    dishes.include?(dish)
  end
end
