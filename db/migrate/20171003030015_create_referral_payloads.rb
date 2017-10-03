class CreateReferralPayloads < ActiveRecord::Migration[5.0]
  def change
    create_view :referral_payloads
  end
end
