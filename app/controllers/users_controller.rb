class UsersController < ApplicationController

  def login
    user = User.find_or_create_by(login_params)
    render :json => user.id
  end

  private

  def login_params
    params.require(:user).permit(:name, :email, :facebook_uid, :image_location)
  end

end
