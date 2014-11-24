require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resource :landing, only: [:show]

  resources :surveys do
    resource :confirmations, only: [:show]
    resource :results, only: [:show]
  end

  resources :user_surveys, only: [:create]

  resource :thanks, only: [:show]

  constraints Monban::Constraints::SignedIn.new do
    root "surveys#index", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "landing#show"
  end
end
