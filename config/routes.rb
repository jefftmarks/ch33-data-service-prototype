#frozen_string_literal: true

Rails.application.routes.draw do
  resources :entitlement_statuses, only: :show
end
