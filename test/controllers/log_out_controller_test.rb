require "test_helper"

class LogOutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get log_out_index_url
    assert_response :success
  end
end
