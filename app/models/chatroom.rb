class Chatroom < ApplicationRecord
  has_many :messages
  has_many :user_messages, through: :messages, class_name: :User
  validates :topic, presence: true, uniqueness: true, case_sensitive: false
end
