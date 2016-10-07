require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class SMS

  TIME_FORMAT = "%H:%M"

  def initialize(client: nil)
    @client = client || Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
  end

  def deliver
    args = {
      from: ENV['FROM'],
      to: ENV['TO'],
      body: ENV['BODY'] + delivery_time
    }

    messages.create(args)
  end

  private

  attr_reader :config, :client

  def messages
    client.messages
  end

  def delivery_time
    (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end
end
