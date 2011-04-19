require 'test_helper'

class AlertControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get cancel" do
    get :cancel
    assert_response :success
  end

end
