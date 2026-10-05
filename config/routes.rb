# config/routes.rb

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  root "home#index"

  get "calendar", to: "calendar#show", as: :calendar

  resources :lessons, only: [ :index, :show ] do
    post "bookings",
         to: "bookings#create",
         as: :bookings

    delete "bookings",
           to: "bookings#destroy",
           as: :booking

    post "teacher_applications",
         to: "teacher_applications#create",
         as: :teacher_applications
  end

  get "my_teacher_applications",
      to: "teacher_applications#index",
      as: :my_teacher_applications

  resources :dance_styles, only: [ :index, :show ]

  resources :teachers, only: [ :index, :show ]

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  get "locale/:locale", to: "application#change_locale", as: :change_locale

  namespace :admin do
    resources :lessons do
      member do
        get :participants
        patch :change_teacher
      end
    end

    resources :users
  end
end
