require "net/http"

class PriceGeneratorService
  def initialize(name, price)
    @name = name
    @price = price
  end

  def generate_price
    string = 'cat'
    if @name.match?(/#{string}/)
      new_price = @price * get_length / 5
    end
    new_price
  end

  def get_length
    default = 99
    uri = 'https://catfact.ninja/fact'
    begin
      uri = URI.parse(uri)
      response = Net::HTTP.get_response(uri)
      return JSON.parse(response.body)['length'] if response.code == "200"
      return default
    rescue
      default
    end
  end
end