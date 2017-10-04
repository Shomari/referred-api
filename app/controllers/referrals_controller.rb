class ReferralsController < ApplicationController

  #POST /recommendation
  def create
    recommendation = Recommendation.find params[:recommendation_id]
    referred       = User.find params[:lead_uid]
    business = recommendation.business
    referrer = recommendation.user
    Referral.create!(referrer: referrer, referred: referred, business: business)
    head 200
  rescue ActiveRecord::RecordNotFound
    head 422
  end

  #GET /referrers
  def referrers
    user = User.find params[:id]
    referrers = ReferralPayload.where(referrer_id: user.id ).as_json
    render json: referrers
  rescue ActiveRecord::RecordNotFound
    head 422
  end

  #GET /referreds
  def referreds
    user = User.find params[:id]
    referreds = ReferralPayload.where(referred_id: user.id ).as_json
    render json: referreds
  rescue ActiveRecord::RecordNotFound
    head 422
  end
end
