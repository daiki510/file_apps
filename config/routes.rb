# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :user_files, only: :index
end
