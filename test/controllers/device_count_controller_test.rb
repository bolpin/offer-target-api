require "test_helper"

class DeviceCountControllerTest < ActionDispatch::IntegrationTest
  test "should get android device count" do
    get device_count_url, params: { os: 'android', min_vers: '1.0.10', max_vers: '2.0' }

    assert_response :success
    assert_equal(2, JSON.parse(response.body).first['count'])
  end

  test "should get iOS device count" do
    get device_count_url, params: { os: 'ios' }

    assert_response :success
    assert_equal(1, JSON.parse(response.body).first['count'])
  end
end
