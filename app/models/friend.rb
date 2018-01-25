class Friend < ApplicationRecord
  belongs_to :user
  enum status: %i(Sent Accept)
  scope :status_of, -> (user_id, friend_id){select(:id, :user_id, :friend_id, :status, :created_at).includes(:user).where(user_id: user_id, friend_id: friend_id)}
  scope :list_waiting, -> (current_user_id){select(:id, :user_id, :friend_id, :status, :created_at).includes(:user).where(user_id: current_user_id, status: "Sent")}
  scope :list_request, -> (current_user_id){select(:id, :user_id, :friend_id, :status, :created_at).includes(:user).where(friend_id: current_user_id, status: "Sent")}

end
