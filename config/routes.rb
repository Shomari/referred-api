Rails.application.routes.draw do
  resources :friends
  resources :recommendations
  resources :categories, only: [:index]
  resources :business
  resources :referrals

  get '/biz_recommendations/:id', to: 'business_recommendations#index'
  get '/act_recommendations/:id', to: 'business_recommendations#active_index'
  get '/referrers/:id', to: 'referrals#referrers'
  get '/referreds/:id', to: 'referrals#referreds'

  get '/searchFriends', to: 'friends#search_for_friends'

  get '/buid/:id', to: 'business#show_by_buid'
  post '/login', to: 'users#login'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# curl -v -X "POST" "http://localhost:3000/auth/sign_in" \
#      -H "Content-Type: application/json; charset=utf-8" \
#      -d $'{
#   "email": "sho@mail.com",
#   "password": "password"
# }'
