require 'test_helper'

class TopControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get search_station" do
    get :search_station
    assert_response :success
  end

  test "should get search_train" do
    get :search_train
    assert_response :success
  end

end
