require 'test_helper'

class CampusesControllerTest < ActionController::TestCase
  setup do
    @campuse = campuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campuse" do
    assert_difference('Campuse.count') do
      post :create, campuse: { address_1: @campuse.address_1, address_2: @campuse.address_2, director: @campuse.director, image: @campuse.image, name: @campuse.name, website: @campuse.website }
    end

    assert_redirected_to campuse_path(assigns(:campuse))
  end

  test "should show campuse" do
    get :show, id: @campuse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campuse
    assert_response :success
  end

  test "should update campuse" do
    patch :update, id: @campuse, campuse: { address_1: @campuse.address_1, address_2: @campuse.address_2, director: @campuse.director, image: @campuse.image, name: @campuse.name, website: @campuse.website }
    assert_redirected_to campuse_path(assigns(:campuse))
  end

  test "should destroy campuse" do
    assert_difference('Campuse.count', -1) do
      delete :destroy, id: @campuse
    end

    assert_redirected_to campuses_path
  end
end
