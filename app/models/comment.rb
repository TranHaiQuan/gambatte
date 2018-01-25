class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  scope :comment_of, -> (post_id){select(:id, :content, :post_id, :user_id, :created_at, :updated_at).includes(:user).where(post_id: post_id).order(created_at: :desc)}
end
