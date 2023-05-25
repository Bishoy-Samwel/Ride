require File.expand_path('../../config/environment', __dir__)

require 'telegram/bot'

token = '6089186898:AAEL4EtvkMo1IlTgH-jr0I4OJlQP61J1-zE'

CATEGORIES = ["Road", "Mountain", "Hybrid"]

# REPLIES = {
#   'Filter by name' => {
#     "Question" => "Type the name of the bike you want!",
#     "keyboards" => []
#   },
#   'Filter by style' => {
#     "Question" => "Which style you want?",
#     "keyboards" => %w[Road Mountain Hybrid]
#   }
# }

# def keyboard(input)
#   array = input.is_a?(String) ? REPLIES[input]["keyboards"] : input
#   buttons = array.map{|e| Telegram::Bot::Types::KeyboardButton.new(text: e)}
#   Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: [buttons], one_time_keyboard: true)
# end

def format_bikes(text)
  result = Bike.by_name(text).pluck(:name, :price)
  return "Sorry, this bike is currently out of stock. Please check back later!" if result.empty?
  name, price = result.first
  "Bike #{name} will cost you #{price}$"
  # result.map{|name, price| "bike #{name} will cost #{price}"}.join( "\n\n")
end

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id,
                           text: "Hello, #{message.from.first_name}")
    when '/browse_bikes'
      bot.api.send_message(chat_id: message.chat.id,
                           text: "You can filter bikes:",
                           reply_markup: keyboard(REPLIES.keys))
    when '/search'
      bot.api.send_message(chat_id: message.chat.id,
                           text: "Type the name of the bike!")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id,
                           text: "Bye, #{message.from.first_name}")
    else
      bot.api.send_message(chat_id: message.chat.id,
                           text: format_bikes(message.text))
    end
  end
end


