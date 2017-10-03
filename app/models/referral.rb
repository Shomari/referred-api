class Referral < ApplicationRecord
  belongs_to :referrer, class_name: 'User', foreign_key: 'referrer_id'
  belongs_to :referred, class_name: 'User', foreign_key: 'referred_id'
  belongs_to :business

  def self.user_is_referrer(user)
    Referral.where(referrer_id: user.id)
  end

  def self.user_is_referred(user)
    Referral.where(referred_id: user.id)
  end
end
