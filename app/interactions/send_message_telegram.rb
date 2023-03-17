class SendMessageTelegram < ActiveInteraction::Base
  object :user

  def execute
    require 'telegram/bot'

    token = ENV.fetch('TELEGRAM_BOT_TOKEN', nil)
    chat_id = ENV.fetch('CHAT_ID', nil)

    Telegram::Bot::Client.run(token) do |bot|
      bot.api.send_message(chat_id: chat_id, text: "#{user.nickname} has joined")
    end
  end
end