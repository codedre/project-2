Rails.application.routes.draw do
  root to: "home#index"
  get "search", to: "home#search"

  resources :moods do
    resources :foods
  end
end
