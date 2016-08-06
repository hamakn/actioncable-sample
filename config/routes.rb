Rails.application.routes.draw do
  #resources :users
  root to: "lounge#index"

  mount ActionCable.server => "/cable"
end
