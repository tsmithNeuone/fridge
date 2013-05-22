class Recipe < ActiveRecord::Base
  attr_accessible :recipe_name
  has_many :ing_rec_joins
  has_many :ingredients, :through => :ing_rec_joins
  
end
