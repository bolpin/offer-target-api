require "application_system_test_case"

class PlayersTest < ApplicationSystemTestCase
  setup do
    @player = players(:reba)
  end

  test "visiting the index" do
    visit players_url
    assert_selector "h1", text: "Players"
  end

  # TODO: fix by filling in device attrs, as well(?)

  # test "should create player" do
  #   visit players_url
  #   click_on "New player"
  #
  #   fill_in "Birthdate", with: @player.birthdate
  #   fill_in "First name", with: @player.first_name
  #   # fill_in "player[gender_id]", with: @player.gender_id
  #   fill_in "Last name", with: @player.last_name
  #   fill_in "Operating system", with: @player.device.operating_system_id
  #   fill_in "Locale", with: @player.device.locale_id
  #   click_on "Create Player"
  #
  #   assert_text "Player was successfully created"
  #   click_on "Back"
  # end

  test "should update Player" do
    visit player_url(@player)
    click_on "Edit this player", match: :first

    fill_in "Birthdate", with: @player.birthdate
    fill_in "First name", with: @player.first_name
    # fill_in "player[gender_id]", with: @player.gender_id
    fill_in "Last name", with: @player.last_name
    click_on "Update Player"

    assert_text "Player was successfully updated"
    click_on "Back"
  end

  test "should destroy Player" do
    visit player_url(@player)
    click_on "Destroy this player", match: :first

    assert_text "Player was successfully destroyed"
  end
end
