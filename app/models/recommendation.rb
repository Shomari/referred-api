class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :business

  def self.for_user_with_biz_data(uid)
    where(uid: uid)
  end

  def get_category
    business.category_id
  end


  # Is this makign a query for every call?  If so then fix
  def skeleton_biz_data
    #TODO: User view for payload data
  end


end
