class NutrientsController < ApplicationController
  def index
    @nutrients = Nutrient.all
  end

  def show
    @nutrient = Nutrient.find(params[:id])
  end
end
