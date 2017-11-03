class Message < ApplicationRecord
  belongs_to :user, inverse_of: :messages
  belongs_to :chat_room, inverse_of: :messages
  
  validates :body, presence: true, length: {minimum: 2, maximum: 1000}
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def timestamp
    created_at.strftime('%H:%M - %d %B %Y')
  end
end
