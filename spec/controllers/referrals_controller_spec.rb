RSpec.describe ReferralsController do

  let!(:user) { create(:user) }
  let!(:friend) { create(:user) }
  let!(:business) { create(:business) }
  let!(:recommendation) { create(:recommendation, user: user, business: business) }

  describe 'POST create' do
    it 'should create a referral if provided with valid params' do
      post :create, params: { recommendation_id: recommendation.id,
                              lead_uid: user.id }
      expect(Referral.last.business).to eq(business)
      expect(response.status).to eq(200)
    end

    it 'should return 422 if provided with invalid params' do
      post :create, params: { recommendation_id: 'fake_id',
                              lead_uid: user.id }
      expect(response.status).to eq(422)
    end
  end

  describe 'GET referrers' do
    it 'should return the correct ReferralPayload' do
      Referral.create(business: business, referrer: user, referred: friend)
      get :referrers, params: { id: user.id }
      payload = JSON.parse(response.body).first
      expect(payload['referrer_id']).to eq user.id
    end

    it 'should return 422 if the user is not found' do
      get :referrers, params: { id: -2334}
      expect(response.status).to eq(422)
    end
  end

  describe 'GET referrers' do
    it 'should return the correct ReferralPayload' do
      Referral.create(business: business, referrer: friend, referred: user )
      get :referrers, params: { id: friend.id }
      payload = JSON.parse(response.body).first
      expect(payload['referrer_id']).to eq friend.id
    end

    it 'should return 422 if the user is not found' do
      get :referreds, params: { id: -2334}
      expect(response.status).to eq(422)
    end
  end
end
