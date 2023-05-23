class Bike < ApplicationRecord
  before_create :update_price

  def update_price
    self.price = PriceGeneratorService.new(self.name, self.price).generate_price
  end

end
