require 'test_helper'

class ParticipantControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get my_studies" do
    get :my_studies
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

  test "should get create_study" do
    get :create_study
    assert_response :success
  end

  test "should get study_details" do
    get :study_details
    assert_response :success
  end

end
