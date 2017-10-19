# View Model - Can't save this
class RecommendationPayload < ActiveRecord::Base

  private

  def readonly?
    true
  end
end
