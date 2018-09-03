require "application_system_test_case"

class BundlesTest < ApplicationSystemTestCase
  setup do
    @bundle = bundles(:one)
  end

  test "visiting the index" do
    visit bundles_url
    assert_selector "h1", text: "Bundles"
  end

  test "creating a Bundle" do
    visit bundles_url
    click_on "New Bundle"

    click_on "Create Bundle"

    assert_text "Bundle was successfully created"
    click_on "Back"
  end

  test "updating a Bundle" do
    visit bundles_url
    click_on "Edit", match: :first

    click_on "Update Bundle"

    assert_text "Bundle was successfully updated"
    click_on "Back"
  end

  test "destroying a Bundle" do
    visit bundles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bundle was successfully destroyed"
  end
end
