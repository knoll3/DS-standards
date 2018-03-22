require 'test_helper'

class FramingControllerTest < ActionDispatch::IntegrationTest

  test "should load root" do
    get root_path
    assert_response :success
    assert_select 'title', 'FramingHelper'
  end
end
