class FoodItemsController < ApplicationController
  def index
    if params.has_key? :food_group_id
      @food_items = FoodGroup.find(params[:food_group_id]).food_items
    else
      @food_items = FoodItem.all
    end
  end

  def show
    @food_item = FoodItem.find(params[:id])
  end
end
