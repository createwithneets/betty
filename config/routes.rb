Rails.application.routes.draw do
  get 'messages/index'
  get 'conversations/index'
  devise_for :installs
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

mount Thredded::Engine => '/forum'

get "destroy_user_session", to: "session#delete"

resources :users

resources :products do
  resources :order_items
end

#we want our users to order multiple times
resources :orders

resources :newsletters

resources :meditations

#we only want a user to see ONE Cart

resource :cart

resource :session

resource :account

resources :conversations, only: [:index, :create] do
  resources :messages, only: [:index, :create]
end


get "welcome", to: "pages#welcome"
get "longexhale", to: "pages#longexhale"
get "lightbelly", to: "pages#balloflightbelly"
get "warmlight", to: "pages#balloflightgratitude"
get "bubbles", to: "pages#bubble"
get "bodyscan", to: "pages#bodyscan"
get "distraction", to: "pages#distraction"
get "emotions", to: "pages#emotions"
get "gratitudebodyscan", to: "pages#gratitudebodyscan"
get "gratitudemantra", to: "pages#gratitudemantra"
get "lovingkindness", to: "pages#lovingkindness"
get "ocean", to: "pages#oceanvisualization"
get "sound", to: "pages#sound"
get "bettyland", to:"pages#bettyland"
get "rewards", to: "users#rewards"
get "purchaseconfirmation", to: "pages#purchaseconfirmation"
get "error", to: "pages#error"
root "users#new"

end
