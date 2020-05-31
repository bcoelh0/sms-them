require 'twilio-ruby'

class TwilioService
  attr_reader :client

  DEFAULT_FROM = '+441915804320'

  def self.send_sms(to:, content:)
    treat_phone_number(to)
    new.send_sms(to: to, content: content)
  end

  def initialize
    @client = Twilio::REST::Client.new(
      ENV["TWILIO_ACCOUNT_SID"],
      ENV["TWILIO_AUTH_TOKEN"]
    )
  end

  def send_sms(to:, content:)
    client.messages.create(from: DEFAULT_FROM, to: to, body: content)
  end

  private

  # TODO: obviously needs to be fixed
  def self.treat_phone_number(number)
    "+44#{number}"
  end
end
