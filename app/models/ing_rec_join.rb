class IngRecJoin < ActiveRecord::Base
  attr_accessible :ingredient_id, :recipe_id
  belongs_to :recipe
  belongs_to :ingredients
end
