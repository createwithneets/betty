Rails.application.routes.draw do
  devise_for :installs
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users

resource :session

resource :account

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

root "users#new"

end
