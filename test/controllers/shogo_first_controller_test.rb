require 'test_helper'

class ShogoFirstControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shogo_first_create_url
    assert_response :success
  end

  test "should get update" do
    get shogo_first_update_url
    assert_response :success
  end

end
