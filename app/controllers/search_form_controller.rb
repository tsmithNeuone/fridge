class SearchFormController < ApplicationController
  def index
  end
  
  def new
    redirect_to 'index'
  end
  
  def show
    @list = params[:one],params[:two],params[:three],params[:four]
    @list.delete("")
    @list.each do |entry|
      entry.capitalize!
    end

    @ing_rec_joins = IngRecJoin.all
    @recipes = Recipe.all
    @ingredients = Ingredient.all
    @ing_found = Array.new
    @found_rec_with_all = Array.new
    
    
    @list.each do |user_input|
      if Ingredient.find_by_ingredient_name(user_input) != nil
        @ing_found.push(Ingredient.find_by_ingredient_name(user_input).ingredient_name)
      end
    end
    
    if @ing_found != nil or !@ing_found.empty?
      @recipes.each do |recipe|
        @temp = Array.new
        @rec_ing = IngRecJoin.find_all_by_recipe_id(recipe)
        @rec_ing.each do |ing|
          @temp.push(Ingredient.find(IngRecJoin.find(ing).ingredient_id).ingredient_name)
        end
        @boo_rec_has_all = true
        @ing_found.each do |ing_check|
          @boo_flag = @temp.include?(ing_check)
          if !@boo_flag
            @boo_rec_has_all = false
          end
        end
        if(@boo_rec_has_all)
          @found_rec_with_all.push(Recipe.find(recipe).recipe_name)
        end
      end
      
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list }
    end
  end
  

  

end
