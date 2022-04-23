require "test_helper"

class RolesControllerTest < ActionDispatch::IntegrationTest
  test "should get users" do
    get roles_users_url
    assert_response :success
  end
end
