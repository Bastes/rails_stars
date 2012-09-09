Dummy::Application.routes.draw do
  resources :star_receivers

  mount RailsStars::Engine => '/stars', as: :rails_stars
end
