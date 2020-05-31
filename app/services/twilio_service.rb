require 'twilio-ruby'

class TwilioService
  attr_reader :client

  DEFAULT_FROM = '+441915804320'

  def initialize
    @client = Twilio::REST::Client.new(
      ENV["TWILIO_ACCOUNT_SID"],
      ENV["TWILIO_AUTH_TOKEN"]
    )
  end

  def send_sms(to:, message:)
    client.messages.create(from: DEFAULT_FROM, to: to, body: message)
  end
end
