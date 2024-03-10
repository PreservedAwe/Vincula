require "test_helper"

class SafetyTipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get safety_tips_index_url
    assert_response :success
  end
end
