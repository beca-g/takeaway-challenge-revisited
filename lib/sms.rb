require 'dotenv/load'
require "twilio-ruby"

class Sms
  attr_reader :client
  TIME_FORMAT = "%H:%M"

  def initialize(client = nil)
    @client = client || Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
  end

  def send_sms
    message = client.messages.create(
      body: message_body,
      from: ENV['TWILIO_PHONE_NO'],
      to: ENV['PHONE_NO']
    )
    message.sid
  end

  private

  def message_body
    "Thank you! Your order was placed and will be delivered no later than #{delivery_time}."
  end

  def delivery_time
    (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end
end
