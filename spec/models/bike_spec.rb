require 'rails_helper'

RSpec.describe Bike, type: :model do
  let(:style) { Style.create(name: 'Road') }
  context "when creating a new Bike" do
    it "creates a new record in the database" do
      expect {
        Bike.create(name: "Bike 1", price: 1, style: style)
      }.to change(Bike, :count).by(1)
    end
    it "The price change if the name includes word: cat" do
      price = 1
      bike = Bike.create(name: "Bike 1 cat", price: price, style: style)
      expect(bike.price).not_to eq(price)
    end
    it "The price does not change if the name does not includes word: cat" do
      price = 1
      bike = Bike.create(name: "Bike 1", price: price, style: style)
      expect(bike.price).to eq(price)
    end
  end
end