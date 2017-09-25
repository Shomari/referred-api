class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User', foreign_key: "user_id"
end