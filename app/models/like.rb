class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # scope :like_of, -> (post_id){select(:post_id, :user_id, :created_at, :updated_at).includes(:user).where(post_id: post_id)}
  # scope :liked, ->(post_id, user_id){select(:id).where(user_id: user_id, post_id: post_id)}
end
