require 'test_helper'

class ShogosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shogos_create_url
    assert_response :success
  end

end
