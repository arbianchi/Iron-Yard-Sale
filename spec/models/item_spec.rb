require 'rails_helper'

RSpec.describe Item, type: :model do

  describe "initialization" do
    let(:item) { Item.new }

    it "considers an item with no inventory to have no quantity" do
      expect(item.quantity).to eq(0)
    end
  end
end
