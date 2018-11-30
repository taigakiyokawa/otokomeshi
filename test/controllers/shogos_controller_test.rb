require 'test_helper'

class ShogosControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get shogos_update_url
    assert_response :success
  end

end
