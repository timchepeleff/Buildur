Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root "static#index"

  resources :users do
    resources :friendships
  end

  post "project/:id/add" => "projects#add", as: :project_add

  resources :rejects

   resources :conversations do
    resources :messages
  end
end
