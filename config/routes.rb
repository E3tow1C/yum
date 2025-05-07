Rails.application.routes.draw do
  resources :courses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Authentication routes
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/:provider/sign-out/callback", to: "sessions#sign_out_keycloak_success"
  get "auth/failure", to: "sessions#failure"
  get "signout", to: "sessions#destroy", as: :signout

  # Protected routes
  get "dashboard", to: "dashboard#index", as: :dashboard

  # Home page
  root "home#index"

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
