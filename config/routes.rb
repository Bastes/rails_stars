RailsStars::Engine.routes.draw do
  resources :stars, only: :create
end
