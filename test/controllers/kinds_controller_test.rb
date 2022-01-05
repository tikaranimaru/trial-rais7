require "test_helper"

class KindsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kind = kinds(:one)
  end

  test "should get index" do
    get kinds_url
    assert_response :success
  end

  test "should get new" do
    get new_kind_url
    assert_response :success
  end

  test "should create kind" do
    assert_difference("Kind.count") do
      post kinds_url, params: { kind: { name: @kind.name } }
    end

    assert_redirected_to kind_url(Kind.last)
  end

  test "should show kind" do
    get kind_url(@kind)
    assert_response :success
  end

  test "should get edit" do
    get edit_kind_url(@kind)
    assert_response :success
  end

  test "should update kind" do
    patch kind_url(@kind), params: { kind: { name: @kind.name } }
    assert_redirected_to kind_url(@kind)
  end

  test "should destroy kind" do
    assert_difference("Kind.count", -1) do
      delete kind_url(@kind)
    end

    assert_redirected_to kinds_url
  end
end
