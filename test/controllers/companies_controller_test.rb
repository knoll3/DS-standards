require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get companies_update_url
    assert_response :success
  end

end
