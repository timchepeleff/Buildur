Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :users do
    resources :friendships
  end

  root 'users#index'
end
