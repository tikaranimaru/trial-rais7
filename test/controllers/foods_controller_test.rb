require "test_helper"

class FoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food = foods(:one)
  end

  test "should get index" do
    get foods_url
    assert_response :success
  end

  test "should get new" do
    get new_food_url
    assert_response :success
  end

  test "should create food" do
    assert_difference("Food.count") do
      post foods_url, params: { food: { deleted_at: @food.deleted_at, is_deleted: @food.is_deleted, kind_id: @food.kind_id, memo: @food.memo, name: @food.name, price: @food.price } }
    end

    assert_redirected_to food_url(Food.last)
  end

  test "should show food" do
    get food_url(@food)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_url(@food)
    assert_response :success
  end

  test "should update food" do
    patch food_url(@food), params: { food: { deleted_at: @food.deleted_at, is_deleted: @food.is_deleted, kind_id: @food.kind_id, memo: @food.memo, name: @food.name, price: @food.price } }
    assert_redirected_to food_url(@food)
  end

  test "should destroy food" do
    assert_difference("Food.count", -1) do
      delete food_url(@food)
    end

    assert_redirected_to foods_url
  end
end
