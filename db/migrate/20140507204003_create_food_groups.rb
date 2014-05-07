class CreateFoodGroups < ActiveRecord::Migration
  def change
    create_table :food_groups do |t|
      t.integer :usda_id
      t.string :name

      t.timestamps
    end
  end
end
