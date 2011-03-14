require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  test "should get locate_car" do
    get :locate_car
    assert_response :success
  end

end
