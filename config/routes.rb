Rails.application.routes.draw do
  resources :rewards, defaults: { format: :json }

  resources :users, defaults: { format: :json } do
    resources :user_rewards, defaults: { format: :json }
    member do
      get :reward_points
      get :rewards_redeemed
    end
  end
end
