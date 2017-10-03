class ReferralsController < ApplicationController
  def create
    rec = Recommendation.find params[:recommendation_id]
    biz = rec.business
    referrer = rec.user
    referred = User.find params[:lead_uid]
    Referral.create!(referrer: referrer, referred: referred, business: biz)
  end

  def referrers
    user = User.find params[:id]
    referrers = ReferralPayload.where(referrer_id: user.id ).as_json
    render json: referrers
  end

  def referreds
    user = User.find params[:id]
    referreds = ReferralPayload.where(referred_id: user.id ).as_json
    render json: referreds
  end

  # def show
  #   user = User.find params[:id]
  #   referrers = ReferralPayload.where(referrer_id: user.id ).as_json
  #   referreds = ReferralPayload.where(referred_id: user.id ).as_json
  #   payload = {referrer: referrers, referreds: referreds}
  #   render json: payload
  # end

end
