require "test_helper"

class OfferTargetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer_target = offer_targets(:os_version_conditional)
  end

  test "should get index" do
    get offer_targets_url
    assert_response :success
  end

  test "should get new" do
    get new_offer_target_url
    assert_response :success
  end

  test "should show offer_target" do
    get offer_target_url(@offer_target)
    assert_response :success
  end

  test "should get edit" do
    get edit_offer_target_url(@offer_target)
    assert_response :success
  end

  # test "should update offer_target" do
  #   patch offer_target_url(@offer_target),
  #   params: {
  #     offer_target: {
  #       gender_id: @offer_target.gender_id,
  #       locale_id: @offer_target.locale_id,
  #       max_player_age: @offer_target.max_player_age,
  #       min_os_major_version: @offer_target.min_os_major_version,
  #       min_os_minor_version: @offer_target.min_os_minor_version,
  #       min_os_patch_version: @offer_target.min_os_patch_version,
  #       min_player_age: @offer_target.min_player_age,
  #       offer_id: @offer_target.offer_id,
  #       operating_system_id: @offer_target.operating_system_id
  #     }
  #   }
  #   assert_redirected_to offer_target_url(@offer_target)
  # end

  test "should destroy offer_target" do
    assert_difference("OfferTarget.count", -1) do
      delete offer_target_url(@offer_target)
    end

    assert_redirected_to offer_targets_url
  end
end
