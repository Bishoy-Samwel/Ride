class PriceGeneratorService
  def initialize(name, price)
    @name = name
    @price = price
  end

  def generate_price
    string = 'cat'
    if @name.match?(/#{string}/)
      new_price = @price * length / 5
    end
    new_price
  end

  def get_length
    length = 99
  end
end