class RecommendationsController < ApplicationController

  #GET /recommendations/:id
  def show
    @recommendations = Recommendation.where(user_id: params[:id])
    render json: @recommendations
  rescue
    head 400
  end

  def create
    recommendation = Recommendation.new(business_params)
    return head 400 unless recommendation.save!
    head 200
  end

  def destroy
    binding.pry
    recommendation = Recommendation.find params[:id]
    return head 400 unless recommendation.destroy!
    head 200
  end

  def delete
    binding.pry
  end

  private

  def business_params
    user = User.find params[:uid]
    {business_id: params[:business][:id], user: user, text: params[:text]}
  end

end
