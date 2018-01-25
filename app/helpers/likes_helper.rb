module LikesHelper
  def like? post_id
    current_user.likes.find_by(post_id: post_id)
  end
end
