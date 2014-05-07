class FoodItem < ActiveRecord::Base
  belongs_to :food_group
  has_many :nutritional_contents
end
