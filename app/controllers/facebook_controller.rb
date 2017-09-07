class FacebookController < ApplicationController
  def auth
    # query = {client_id: 1232455580233965, redirect_uri: 'http://localhost:3000/callback', client_secret: '87969620689c8ad5e0c864840555d162', code: params['code']}
    # response = HTTParty.get('https://graph.facebook.com/v2.10/oauth/access_token', query: query)
    # token = response['access_token']
    # fb_user_id = HTTParty.get("https://graph.facebook.com/me?fields=id&access_token=#{token}")
    binding.pry
    redirect_to "http://localhost:4200"
    # head :ok
  #   GET https://graph.facebook.com/v2.10/oauth/access_token?
  #  client_id={app-id}
  #  &redirect_uri={redirect-uri}
  #  &client_secret={app-secret}
  #  &code={code-parameter}
  end

  def token
    binding.pry
  end
end
