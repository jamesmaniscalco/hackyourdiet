class FoodGroupsController < ApplicationController
  def index
    @food_groups = FoodGroup.all
  end

  def show
    @food_group = FoodGroup.find(params[:id])
  end
end
