class GetInfoPageController < ApplicationController
    # GET /ing_rec_joins
  # GET /ing_rec_joins.json
  def index
    @ing_rec_joins = IngRecJoin.all
    @recipes = Recipe.all
    @ingredients = Ingredient.all
        respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ing_rec_joins }
  end
end
end