class BusinessRecommendationsController < ApplicationController

  def index
    id = params[:id]
    recommendations = RecommendationPayload.where(business_id: id, status: 'pending')
    render json: recommendations
  end

  def active_index
    id = params[:id]
    recommendations = RecommendationPayload.where(business_id: id, status: 'active')
    render json: recommendations
  end
end
