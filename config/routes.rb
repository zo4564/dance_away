Rails.application.routes.draw do
  get "home/index"

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  root "home#index"

  get "callendar", to: "callendar#show", as: :callendar

  get "lessons", to: "lessons#index"
  get "lessons/:id", to: "lessons#show", as: :lesson

  post "lessons/:lesson_id/bookings",
       to: "bookings#create",
       as: :lesson_bookings

  delete "lessons/:lesson_id/bookings",
         to: "bookings#destroy",
         as: :lesson_booking

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end