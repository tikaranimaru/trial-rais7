require "application_system_test_case"

class KindsTest < ApplicationSystemTestCase
  setup do
    @kind = kinds(:one)
  end

  test "visiting the index" do
    visit kinds_url
    assert_selector "h1", text: "Kinds"
  end

  test "should create kind" do
    visit kinds_url
    click_on "New kind"

    fill_in "Name", with: @kind.name
    click_on "Create Kind"

    assert_text "Kind was successfully created"
    click_on "Back"
  end

  test "should update Kind" do
    visit kind_url(@kind)
    click_on "Edit this kind", match: :first

    fill_in "Name", with: @kind.name
    click_on "Update Kind"

    assert_text "Kind was successfully updated"
    click_on "Back"
  end

  test "should destroy Kind" do
    visit kind_url(@kind)
    click_on "Destroy this kind", match: :first

    assert_text "Kind was successfully destroyed"
  end
end
