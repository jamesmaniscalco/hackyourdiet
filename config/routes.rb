Hackyourdiet::Application.routes.draw do
  # API stuff
  resources :food_groups, only: [:index, :show]

  resources :food_items, only: [:index, :show]


end
