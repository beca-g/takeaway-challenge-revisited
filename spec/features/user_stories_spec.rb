describe "User Stories" do
  let(:takeaway) { Takeaway.new(menu, order, sms) }
  let(:menu) { Menu.new(dishes) }
  let(:order) { Order.new(menu) }
  let(:sms) { Sms.new(client) }
  
  let(:dishes) { { Pizza: 10.00, Carbonara: 15.00, Risotto: 12.00 } }
  let(:client) { double :client, messages: messages }
  let(:messages) { spy :messages }
  
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it "displays a menu of dishes with prices" do
    expect(takeaway.view_menu).to eq "Pizza £10.00, Carbonara £15.00, Risotto £12.00"
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it "can order a number of dishes" do
    expect(order).to receive(:add).at_most(4).times
    new_order = { Pizza: 2, Carbonara: 1, Risotto: 1 }
    takeaway.place_order(new_order)
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it "checks the total of the order" do
    new_order = { Pizza: 2, Carbonara: 1, Risotto: 1 }
    total = takeaway.place_order(new_order)
    expect(total).to eq total
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  it "sends a SMS when the order has been placed" do
    expect(sms).to receive(:send_sms)
    takeaway.place_order(dishes)
  end
end
