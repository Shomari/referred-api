class User < ApplicationRecord
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :referrals
  has_many :recommendations

  # Returns array of friendships
  def all_friends
    friends + inverse_friends
  end

  def recommendations_for_category(category_id)
    recommendations.select { |r| r.get_category == category_id }
  end
end
