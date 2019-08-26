# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :users

  root to: "posts#index"
end
