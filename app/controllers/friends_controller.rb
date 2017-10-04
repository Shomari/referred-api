class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy]

  # GET /friends
  def index
    return head 401 unless active_token?
    user = User.find_by(facebook_uid: @fb_user_id)
    friends = user.all_friends
    #should send an email here: if friend email isn't in database
    render json: friends
  rescue ActiveRecord::RecordNotFound
    head 422
  end

  #GET /searchFriends
  def search_for_friends
    if params[:friendName]
      render json: User.where(name: params[:friendName]).select(:id, :name, :image_location)
    else
      render json: User.where(email: params[:email]).select(:id, :name, :image_location)
    end
  end

  # POST /friends
  def create
    friend = User.find_by email: params[:friend_email]
    user = User.find_by facebook_uid: params[:facebook_uid]
    Friendship.create!(user: user, friend: friend)
    # MAILER: User added friend,  Friend gets email saying user added him
    head :ok
  rescue ActiveRecord::RecordNotFound
    head 422
  end

  private

    def active_token?
      token = params['token']
      fb_response = HTTParty.get("https://graph.facebook.com/me?fields=id&access_token=#{token}")
      @fb_user_id = fb_response['id'].to_i
      fb_response.code == 200 ? true : false
    end

end
