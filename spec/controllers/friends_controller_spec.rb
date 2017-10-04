RSpec.describe FriendsController do

  let!(:user) { create(:user) }
  let!(:friend) { create(:user) }

  describe 'GET index' do
    it 'returns all friends for a user' do
      Friendship.create(user: user, friend: friend)
      fbr = double('fb_response', code: 200)
      allow(HTTParty).to receive(:get).and_return(  fbr )
      allow(fbr).to receive(:[])
      allow(User).to receive(:find_by).and_return(user)
      get :index, params: { token: 'fake_token' }
      payload = JSON.parse(response.body)
      expect(payload.first['id']).to eq(friend.id)
    end
  end

  describe 'POST create' do
    it 'should create a new friendship when supplied with valid params' do
      post :create, params: { friend_email: friend.email, facebook_uid: user.facebook_uid }
      friendship = Friendship.where(user: user, friend: friend).first
      expect(friendship).not_to be_nil
    end

  end

end
