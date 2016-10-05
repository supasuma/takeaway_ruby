require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu_list) { {chicken: 3.50}}
  let(:menu) { double(:menu, print: 'Menu List') }

  it 'prints a menu with dishes and prices' do
    expect(takeaway.print_menu).to eq('Menu List')
  end
end
