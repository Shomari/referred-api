class ReferralsController < ApplicationController


  def show
    @referrals = Referral.where(user_id: params[:id])
    render json: @referrals
  end

  def create
    id = params[:id]
    @referrals = Referral.all

    render json: @referrals
  end
end
