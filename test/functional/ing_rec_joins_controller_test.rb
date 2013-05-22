require 'test_helper'

class IngRecJoinsControllerTest < ActionController::TestCase
  setup do
    @ing_rec_join = ing_rec_joins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ing_rec_joins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ing_rec_join" do
    assert_difference('IngRecJoin.count') do
      post :create, ing_rec_join: { ingredient_id: @ing_rec_join.ingredient_id, recipe_id: @ing_rec_join.recipe_id }
    end

    assert_redirected_to ing_rec_join_path(assigns(:ing_rec_join))
  end

  test "should show ing_rec_join" do
    get :show, id: @ing_rec_join
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ing_rec_join
    assert_response :success
  end

  test "should update ing_rec_join" do
    put :update, id: @ing_rec_join, ing_rec_join: { ingredient_id: @ing_rec_join.ingredient_id, recipe_id: @ing_rec_join.recipe_id }
    assert_redirected_to ing_rec_join_path(assigns(:ing_rec_join))
  end

  test "should destroy ing_rec_join" do
    assert_difference('IngRecJoin.count', -1) do
      delete :destroy, id: @ing_rec_join
    end

    assert_redirected_to ing_rec_joins_path
  end
end
