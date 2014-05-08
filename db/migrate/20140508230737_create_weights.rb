class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.integer :food_item_id
      t.string :unit_multiplier
      t.string :unit
      t.float :weight_in_grams

      t.timestamps
    end
  end
end
