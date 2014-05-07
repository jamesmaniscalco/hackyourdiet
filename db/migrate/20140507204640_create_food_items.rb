class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.integer :usda_id
      t.integer :food_group_id
      t.string :description

      t.float :n_factor
      t.float :pro_factor
      t.float :fat_factor
      t.float :cho_factor

      t.timestamps
    end
  end
end
