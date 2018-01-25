module FriendsHelper
  def friend friend_id
    @friend_user = User.find friend_id
    return @friend_user
  end
end
