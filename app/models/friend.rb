class Friend < ApplicationRecord
  belongs_to :user
  enum status: %i(Sent Accept)
  # scope :all_request, -> {select(:id, :user_id, :friend_id, :status, :created_at).includes(:user).where(status: )}
end
