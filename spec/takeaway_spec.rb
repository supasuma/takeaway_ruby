require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  let(:menu_list) { {chicken: 3.50, chips: 2.00}}
  let(:menu) { double(:menu, print: 'Menu List') }
  let(:dishes) { {chicken: 2, chips: 1 }}
  let(:order) { double :order, add: nil, total: 9.00 }

  it 'prints a menu with dishes and prices' do
    expect(takeaway.print_menu).to eq('Menu List')
  end

  it 'can order a number of available dishes' do
    expect(takeaway.place_order(dishes)).to eq("Your order total is £9.00")
  end
end
