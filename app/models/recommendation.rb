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
    payload = self.as_json
    payload["business_name"] = self.business.name
    payload["business_zip"] = self.business.zipcode
    payload["user_name"] = self.user.name
    payload["user_image"] = self.user.image_location
    payload["category"] = self.business.category.name
    payload
  end


end
