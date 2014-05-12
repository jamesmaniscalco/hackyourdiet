Hackyourdiet::Application.routes.draw do
  root to: "home#index"

  # API stuff
  resources :food_groups, only: [:index, :show] do
    resources :food_items, only: :index
  end

  resources :food_items, only: [:index, :show] do
    resources :nutritional_contents, only: :index
    resources :weights, only: :index
  end

  resources :nutrients, only: [:index, :show]

  resources :nutritional_contents, only: :show

end
