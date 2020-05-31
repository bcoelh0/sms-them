class List < ApplicationRecord
  belongs_to :user
  has_many :contacts

  def create_messages(message_params)
    transaction do
      contacts.each do |contact|
        # this seems to not be working. Repeat message con be sent!
        message = contact.messages.find_or_create_by!(content: message_params[:content])
        message.send_sms!
        message.update(sent_at: Time.now)
      end
    rescue
      return false
    end
    true
  end
end
