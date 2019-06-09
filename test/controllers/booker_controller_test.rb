require 'test_helper'

class BookerControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get booker_home_url
    assert_response :success
  end

end
