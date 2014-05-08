class WeightsController < ApplicationController
  def index
    @weights = FoodItem.find(params[:food_item_id]).weights
  end
end
