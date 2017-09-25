class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :update, :destroy]

  # GET /friends
  def index
    return head 400 unless active_token?
    user = User.find_by(facebook_uid: @fb_user_id)
    friends = user.all_friends
    #should send an email here: if friend email isn't in database
    render json: friends
  end

  # GET /friends/1
  def show
    render json: @friend
  end

  # POST /friends
  def create
    friend = User.find_by email: params[:friend_email]
    user = User.find_by facebook_uid: params[:facebook_uid]
    Friendship.create!(user: user, friend: friend)
    head :ok
  end

  # PATCH/PUT /friends/1
  def update
    if @friend.update(friend_params)
      render json: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  # DELETE /friends/1
  def destroy
    @friend.destroy
  end

  private

    def active_token?
      token = params['token']
      fb_response = HTTParty.get("https://graph.facebook.com/me?fields=id&access_token=#{token}")
      @fb_user_id = fb_response['id'].to_i
      fb_response.code == 200 ? true : false
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def friend_params
      params.require(:friend).permit(:name)
    end
end
