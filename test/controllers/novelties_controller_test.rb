require 'test_helper'

class NoveltiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get novelties_show_url
    assert_response :success
  end

end
