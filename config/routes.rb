# frozen_string_literal: true

Rails.application.routes.draw do

  # API
  namespace :api do
    namespace :v1 do
      resources :menus, except: [:new, :edit] do
        resources :items, only: [:create, :update, :destroy]
      end
    end
  end
end
