require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get convert" do
    get :convert
    assert_response :success
  end

end
