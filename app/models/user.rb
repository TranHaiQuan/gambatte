class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :friends
  has_many :posts
  has_many :posts, through: :comments
  has_many :posts, through: :likes
end
