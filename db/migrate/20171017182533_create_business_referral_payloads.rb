class CreateBusinessReferralPayloads < ActiveRecord::Migration[5.0]
  def change
    create_view :business_referral_payloads
  end
end
