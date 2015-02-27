require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get students" do
    get :students
    assert_response :success
  end

  test "should get faculty" do
    get :faculty
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get terms" do
    get :terms
    assert_response :success
  end

  test "should get site_map" do
    get :site_map
    assert_response :success
  end

  test "should get faq" do
    get :faq
    assert_response :success
  end

end
