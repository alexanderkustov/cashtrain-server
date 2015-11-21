require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get stations" do
    get :stations
    assert_response :success
  end

end
