class SearchFormController < ApplicationController
  def index
  end
  
  def new
    redirect_to 'index'
  end
  
  def show
    @list_user_input = params[:one],params[:two],params[:three],params[:four]
    @list_user_input.delete("")
    @list_user_input.each do |entry|
      entry.gsub!(/\s+/, "")
      entry.capitalize!
    end

    @ing_rec_joins = IngRecJoin.all
    @recipes = Recipe.all
    @ingredients = Ingredient.all
    @user_input_found_in_ingredients = Array.new
    @found_recipe_with_all_ingredients = Array.new
    
    
    @list_user_input.each do |user_input|
      if Ingredient.find_by_ingredient_name(user_input) != nil
        @user_input_found_in_ingredients.push(Ingredient.find_by_ingredient_name(user_input).ingredient_name)
      end
    end
    
    if @user_input_found_in_ingredients != nil or !@user_input_found_in_ingredients.empty?
      @recipes.each do |recipe|
        @temp = Array.new
        @recipe_ingredients = IngRecJoin.find_all_by_recipe_id(recipe)
        @recipe_ingredients.each do |ing|
          @temp.push(Ingredient.find(IngRecJoin.find(ing).ingredient_id).ingredient_name)
        end
        @boo_rec_has_all = true
        @user_input_found_in_ingredients.each do |ing_check|
          @boo_flag = @temp.include?(ing_check)
          if !@boo_flag
            @boo_rec_has_all = false
          end
        end
        if(@boo_rec_has_all)
          @found_recipe_with_all_ingredients.push(Recipe.find(recipe).recipe_name)
        end
      end
      
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list_user_input }
    end
  end
  

  

end
