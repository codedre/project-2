Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "home#index"
  get "search", to: "home#search"

  resources :moods do
    resources :foods
  end

#   devise_scope :user do
#   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end
end
