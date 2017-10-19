class CreateRecommendationPayloads < ActiveRecord::Migration[5.0]
  def change
    create_view :recommendation_payloads
  end
end
