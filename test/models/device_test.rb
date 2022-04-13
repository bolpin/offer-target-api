require "test_helper"

class DeviceTest < ActiveSupport::TestCase
  def setup
    valid_attributes = {
      model: "tablet",
      os_version: '2.12',
      operating_system: operating_systems(:android),
      locale: locales(:en_US),
      player: players(:reba)
    }

    @device = Device.new(valid_attributes)
  end

  test "valid device attributes" do
    assert @device.valid?
  end

  test "locale is present" do
    @device.locale = nil
    refute @device.valid?
  end

  test "player is present" do
    @device.player = nil
    refute @device.valid?
  end

  test "operating system is present" do
    @device.operating_system = nil
    refute @device.valid?
  end

  test "valid version formats" do
    valids = ['5', '5-alpha', '5.0', '5.0-beta',
              '5.0.0', '5.0.0-beta2', '444.444.22222222']
    for vers in valids do
      @device.os_version = vers
      assert @device.valid?, "#{vers} should be valid"
    end
  end

  test "invalid version formats" do
    invalids = ['10.1+blip', 'myOS.42.0', '43.0.0-a+b']
    for vers in invalids do
      @device.os_version = vers
      refute @device.valid?, "#{vers} should not be valid"
    end
  end

  test "strips pre-release segments off and adds minor-version-, and patch-version-segments as needed" do
    @device.os_version = '5-beta'
    assert_equal @device.os_version, '5.0.0'
  end

end
