class ChatRoom < ApplicationRecord
  
  scope :by_user, -> (id) { where('user_id = ? OR receiver_id = ?', id, id) }

  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :title, presence: true
  validates :receiver_id, presence: true

end
