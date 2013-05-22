class CreateIngRecJoins < ActiveRecord::Migration
  def change
    create_table :ing_rec_joins do |t|
      t.integer :recipe_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
