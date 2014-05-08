# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# seed the food groups
open("#{Rails.root}/usda_source/FD_GROUP.txt", 'r:iso-8859-1:utf-8') do |foodgroups|
  foodgroups.read.each_line do |foodgroup|
    usda_id, name = foodgroup.chomp.split("^")
    usda_id = usda_id.gsub(/\A[~]+|[~]+\Z/, '').to_i
    name = name.gsub(/\A[~]+|[~]+\Z/, '')
    FoodGroup.find_or_initialize_by(usda_id: usda_id).tap do |group|
      group.name = name
    end.save!
  end
end

# seed the food items
open("#{Rails.root}/usda_source/FOOD_DES.txt", 'r:iso-8859-1:utf-8') do |fooditems|
  fooditems.read.each_line do |fooditem|
    # all the a1, a2, etc. are unneeded columns. This could be neater, but whatever.
    usda_id, food_group_id, description, a1, a2, a3, a4, a5, a6, a7, n_factor, pro_factor, fat_factor, cho_factor = fooditem.chomp.split("^")
    usda_id = usda_id.gsub(/\A[~]+|[~]+\Z/, '').to_i
    food_group = FoodGroup.find_by(usda_id: food_group_id.gsub(/\A[~]+|[~]+\Z/, '').to_i)
    description = description.gsub(/\A[~]+|[~]+\Z/, '')
    n_factor = (n_factor or "").gsub(/\A[~]+|[~]+\Z/, '').to_f
    pro_factor = (pro_factor or "").gsub(/\A[~]+|[~]+\Z/, '').to_f
    fat_factor = (fat_factor or "").gsub(/\A[~]+|[~]+\Z/, '').to_f
    cho_factor = (cho_factor or "").gsub(/\A[~]+|[~]+\Z/, '').to_f
    FoodItem.find_or_initialize_by(usda_id: usda_id).tap do |item|
      item.food_group = food_group
      item.description = description
      item.n_factor = n_factor
      item.pro_factor = pro_factor
      item.fat_factor = fat_factor
      item.cho_factor = cho_factor
    end.save!
  end
end

# seed the nutrients
open("#{Rails.root}/usda_source/NUTR_DEF.txt", 'r:iso-8859-1:utf-8') do |nutrients|
  nutrients.read.each_line do |nutrient|
    usda_id, unit, a1, name, a2, a3 = nutrient.chomp.split("^")
    usda_id = usda_id.gsub(/\A[~]+|[~]+\Z/, '').to_i
    unit = unit.gsub(/\A[~]+|[~]+\Z/, '')
    name = name.gsub(/\A[~]+|[~]+\Z/, '')
    Nutrient.find_or_initialize_by(usda_id: usda_id).tap do |nutr|
      nutr.unit = unit
      nutr.name = name
    end.save!
  end
end

# seed the nutritional contents
open("#{Rails.root}/usda_source/NUT_DATA.txt", 'r:iso-8859-1:utf-8') do |nutritionalcontents|
  nutritionalcontents.read.each_line do |nutritionalcontent|
    food_item_id, nutrient_id, amount_per_100g, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15 = nutritionalcontent.chomp.split("^")
    food_item = FoodItem.find_by(usda_id: food_item_id.gsub(/\A[~]+|[~]+\Z/, '').to_i)
    nutrient = Nutrient.find_by(usda_id: nutrient_id.gsub(/\A[~]+|[~]+\Z/, '').to_i)
    amount_per_100g = (amount_per_100g or "").gsub(/\A[~]+|[~]+\Z/, '').to_f
    NutritionalContent.find_or_initialize_by(food_item: food_item, nutrient: nutrient).tap do |content|
      content.amount_per_100g = amount_per_100g
    end.save!
  end
end

