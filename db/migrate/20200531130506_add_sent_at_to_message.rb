class AddSentAtToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :sent_at, :datetime
  end
end
