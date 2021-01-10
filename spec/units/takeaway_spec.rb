require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu, view: view_menu}
  let(:view_menu) { "Pizza: £10.00" }

  it "displays a menu of dishes with prices" do
    expect(takeaway.view_menu).to eq view_menu
  end
end