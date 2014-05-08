class FoodGroupsController < ApplicationController
  def index
    @food_groups = FoodGroup.all
  end
end
