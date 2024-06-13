require 'telegram/bot'

# Токен вашего бота, полученный от BotFather
TOKEN = '6366017744:AAG5nahG8HiKS_-lN-xSDN4L3gAjmC2q-W4'

# Определение метода-обработчика для команды /start
def start_command(bot, message)
  bot.api.send_message(chat_id: message.chat.id, text: "Привет, #{message.from.first_name}! Я бот, который может отвечать на сообщения.")
end

# Определение метода-обработчика для текстовых сообщений
def message_response(bot, message)
  bot.api.send_message(chat_id: message.chat.id, text: "Ты написал: #{message.text}")
end

def count_characters(bot, message)
  text = message.text.strip
  char_count = text.length
  bot.api.send_message(chat_id: message.chat.id, text: "В вашем сообщении #{char_count} символов.")
end


# Основной метод бота
def main
  Telegram::Bot::Client.run(TOKEN) do |bot|
    bot.listen do |message|
      case message.text
      when '/start'
        start_command(bot, message)       
      else
        count_characters(bot, message)
      end
    end
  end
end

# Запуск бота
main if __FILE__ == $PROGRAM_NAME
