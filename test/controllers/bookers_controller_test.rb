require 'test_helper'

class BookersControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get bookers_top_url
    assert_response :success
  end

end
