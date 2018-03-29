class Post < ApplicationRecord
	searchkick word_start: [:title, :content], suggest: [:title]
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :users_like, through: :likes, class_name: :User
  has_many :users_comment, through: :comments, class_name: :User
  scope :all_post, -> {select(:id, :user_id, :title, :content, :liked, :created_at, :updated_at).includes(:user, :likes, :comments).order(created_at: :desc)}
  scope :post_of, -> (user_id){select(:id, :user_id, :title, :content, :liked, :created_at, :updated_at).includes(:user, :likes, :comments).where(user_id: user_id).order(created_at: :desc)}
  
  
end
