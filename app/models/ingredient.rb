class Ingredient < ActiveRecord::Base
  attr_accessible :ingredient_name
  has_many :ing_rec_joins
  has_many :recipes, :through => :ing_rec_join
end
