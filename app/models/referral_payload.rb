# View Model - Can't save this
class ReferralPayload < ActiveRecord::Base

  private

  def readonly?
    true
  end
end
