class CreateNutritionalContents < ActiveRecord::Migration
  def change
    create_table :nutritional_contents do |t|
      t.integer :food_item_id
      t.integer :nutrient_id
      t.float :amount_per_100g

      t.timestamps
    end
  end
end
