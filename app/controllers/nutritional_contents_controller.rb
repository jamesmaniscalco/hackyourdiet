class NutritionalContentsController < ApplicationController
  
  
  def index
    if params.has_key? :food_item_id
      @nutritional_contents = FoodItem.find(params[:food_item_id]).nutritional_contents
    else
      @nutritional_contents = NutritionalContent.all
    end
  end

  def show
    @nutritional_content = NutritionalContent.find(params[:id])
  end
end
