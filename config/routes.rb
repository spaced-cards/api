# frozen_string_literal: true

require "api_constraints"

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: "json" } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :deck_categories, only: :index do
        resources :decks
      end
    end
  end
end
