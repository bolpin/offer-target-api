require "test_helper"

# players matching each offer:
#   Offer PlayerIDs
#   ----- ---------
#   1     3,4,5,6
#   2     3,4,5
#   3     1
#   4     7
#   5     2

class TotalPayoutControllerTest < ActionDispatch::IntegrationTest

  test "should get payout for those over 45" do
    get total_payout_url, params: { min_age: '45', max_age: '150' }

    assert_response :success
    assert_equal(2, JSON.parse(response.body).first['amount'])
  end

  test "should get payout for those under 45" do
    get total_payout_url, params: { min_age: '1', max_age: '45' }

    assert_response :success
    assert_equal(38, JSON.parse(response.body).first['amount'])
  end

  test "should get total payout for all players ages 1 to 150" do
    get total_payout_url, params: { min_age: '1', max_age: '150' }

    assert_response :success
    assert_equal(40, JSON.parse(response.body).first['amount'])
  end
end
