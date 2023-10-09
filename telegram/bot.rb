require 'telegram/bot'
require 'net/ping'

# Замените 'YOUR_BOT_TOKEN' на полученный от @BotFather токен вашего бота
TOKEN = '6697943644:AAEgWhqL7QCRwwn-i_WPcCnKiJ0JUAWMYbE'

# Метод для проверки сетевого соединения с заданным устройством
def check_network(device)
  ping = Net::Ping::External.new(device)
  if ping.ping?
    return "Устройство #{device} доступно."
  else
    return "Устройство #{device} недоступно."
  end
end

# Обработчик команды /start
def start_command(message)
  bot.api.send_message(chat_id: message.chat.id, text: "Привет! Этот бот поможет вам проверить сетевое соединение с устройством.")
end

# Обработчик команды /check
def check_command(message)
  device = message.text.split(' ')[1]
  if device
    response = check_network(device)
  else
    response = "Пожалуйста, укажите устройство для проверки сетевого соединения. Пример: /check google.com"
  end
  bot.api.send_message(chat_id: message.chat.id, text: response)
end

# Инициализация бота
Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      start_command(message)
    when '/check'
      check_command(message)
    else
      bot.api.send_message(chat_id: message.chat.id, text: "Я не понимаю данную команду. Воспользуйтесь /start для начала.")
    end
  end
end
