class RecommendationsController < ApplicationController

  #GET /recommendations
  def index
    user = User.find params[:uid]
    friends = user.all_friends
    recommendations = friends.map { |friend| friend.recommendations_for_category(params[:cid].to_i) }
    recommendations = recommendations.flatten.map(&:skeleton_biz_data)
    render json: recommendations
  end

  #GET /recommendations/:id
  def show
    recommendations = Recommendation.where(user_id: params[:id])
    recommendations = recommendations.map(&:skeleton_biz_data)
    render json: recommendations
  rescue
    head 400
  end

  #POST /recommendations
  def create
    recommendation = Recommendation.new(business_params)
    return head 400 unless recommendation.save!
    head 200
  end

  #DELETE /recommendations/:id
  def destroy
    recommendation = Recommendation.find params[:id]
    return head 400 unless recommendation.destroy!
    head 200
  end

  private

  def business_params
    user = User.find params[:uid]
    {business_id: params[:business][:id], user: user, text: params[:text]}
  end
end
