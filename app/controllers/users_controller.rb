class UsersController < ApplicationController

  def login
    binding.pry
    user = User.find_or_create_by(login_params)
    # token = params['user']['token']
    # fuid = user.facebook_uid

    fb_response = HTTParty.get("https://graph.facebook.com/me?fields=id&access_token=#{token}")
    render :json => user.id
  end

  private

  def login_params
    params.require(:user).permit(:name, :email, :facebook_uid, :image_location)
  end

end
