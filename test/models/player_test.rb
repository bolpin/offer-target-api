require "test_helper"

class PlayerTest < ActiveSupport::TestCase

  def setup
    valid_attributes = {
      gender: genders(:female),
      birthdate: 50.years.ago.to_date,
      last_name: 'Theo',
      first_name: 'Liz'
    }

    @player = Player.new(valid_attributes)
  end

  test "is old enough on 14th birthday" do
    b_day = 14.years.ago.to_date
    @player.birthdate = b_day

    assert @player.valid?, "Birthdate on #{b_day} means player is old enough"
  end

  test "is not old enough the day before 14th birthday" do
    b_day = 14.years.ago.to_date.tomorrow
    @player.birthdate = b_day

    refute @player.valid?, "Birthdate on #{b_day} means player is not old enough"
  end

  test "valid player" do
    assert @player.valid?
  end

  test "last name is present" do
    @player.last_name = "    "

    refute @player.valid?
  end

end
