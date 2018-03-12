require 'test_helper'

class FramingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get framing_index_url
    assert_response :success
  end

  test "should get show" do
    get framing_show_url
    assert_response :success
  end

end
