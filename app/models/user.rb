class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :friends
  has_many :comments
  has_many :likes
  has_many :posts
  has_many :posts_comment, through: :comments, class_name: :Post
  has_many :posts_like, through: :likes, class_name: :Post
  has_many :messages
  has_many :chatroom_message, through: :messages, class_name: :Chatroom
  enum sex: %i(Male Female)
  has_attached_file :image, default_url: "/images/avatardefault.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
