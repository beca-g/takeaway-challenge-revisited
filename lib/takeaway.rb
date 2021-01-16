require "order"
require "sms"

class Takeaway
  attr_reader :menu, :order, :sms

  def initialize(menu, order = nil, sms = nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || Sms.new(config)
  end

  def view_menu
    menu.view
  end

  def place_order(dishes)
    add_dishes(dishes)
    sms.send_sms
    order.total
  end

  private
  
  def add_dishes(dishes)
    dishes.map { |dish, quantity|
      order.add(dish, quantity)
    }
  end
end
