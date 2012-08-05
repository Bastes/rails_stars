RailsStars::Engine.routes.draw do
  scope "rails_stars", :module => :rails_stars, :as => 'rails_stars' do
    resources :stars, only: :create
  end
end
