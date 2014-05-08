Hackyourdiet::Application.routes.draw do
  # API stuff
  resources :food_groups, only: [:index, :show] do
    resources :food_items, only: [:index, :show]
  end

  resources :food_items, only: [:index, :show]


end
