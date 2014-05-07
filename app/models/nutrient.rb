class Nutrient < ActiveRecord::Base
  has_many :nutritional_contents
end
