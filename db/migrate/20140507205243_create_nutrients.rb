class CreateNutrients < ActiveRecord::Migration
  def change
    create_table :nutrients do |t|
      t.integer :usda_id
      t.string :unit
      t.string :name

      t.timestamps
    end
  end
end
