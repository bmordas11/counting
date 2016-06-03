require 'rails_helper'

RSpec.describe Receipt, type: :model do
  let(:chunks) do
    Receipt.create(
      title: "Fruit chunks",
      date: "3-9-2015",
      amount: 3204.21
    )
  end
  it "should accept the given receipt as valid" do
    expect(chunks.valid?).to be true
  end
end
