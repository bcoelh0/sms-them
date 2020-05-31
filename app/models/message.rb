class Message < ApplicationRecord
  belongs_to :contact

  def send_sms!
    return if sent?

    # TODO: throw an exception if Twilio can't send the sms
    TwilioService.send_sms(to: contact.phone_number, content: content)
  end

  private

  def sent?
    !!sent_at
  end
end
