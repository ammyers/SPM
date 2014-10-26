require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get admin" do
    get :admin
    assert_response :success
  end

  test "should get all_studies" do
    get :all_studies
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get study_details" do
    get :study_details
    assert_response :success
  end

end
