require "application_system_test_case"

class OfferTargetsTest < ApplicationSystemTestCase
  setup do
    @offer_target = offer_targets(:os_version_conditional)
  end

  test "visiting the index" do
    visit offer_targets_url
    assert_selector "h1", text: "Offer targets"
  end

  test "should destroy Offer target" do
    visit offer_target_url(@offer_target)
    click_on "Destroy this offer target", match: :first

    assert_text "Offer target was successfully destroyed"
  end
end
