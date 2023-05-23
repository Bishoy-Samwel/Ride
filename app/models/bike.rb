class Bike < ApplicationRecord
  has_one_attached :image
  before_create :update_price

  def update_price
    self.price = PriceGeneratorService.new(self.name, self.price).generate_price
  end

end
