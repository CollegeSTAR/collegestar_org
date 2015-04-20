require 'test_helper'

class CampusesControllerTest < ActionController::TestCase
  setup do
    @campus = campuses(:one)
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
    assert_difference('Campus.count') do
      post :create, campus: { abbreviation: @campus.abbreviation, address_1: @campus.address_1, address_2: @campus.address_2, city: @campus.city, director_id: @campus.director_id, name: @campus.name, state: @campus.state, institution_type: @campus.institution_type, website_url: @campus.website_url, zip: @campus.zip }
    end

    assert_redirected_to campus_path(assigns(:campus))
  end

  test "should show campus" do
    get :show, id: @campus
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campus
    assert_response :success
  end

  test "should update campus" do
    patch :update, id: @campus, campus: { abbreviation: @campus.abbreviation, address_1: @campus.address_1, address_2: @campus.address_2, city: @campus.city, director_id: @campus.director_id, name: @campus.name, state: @campus.state, institution_type: @campus.institution_type, website_url: @campus.website_url, zip: @campus.zip }
    assert_redirected_to campus_path(assigns(:campus))
  end

  test "should destroy campus" do
    assert_difference('Campus.count', -1) do
      delete :destroy, id: @campus
    end

    assert_redirected_to campuses_path + "?notice=Campus+was+successfully+destroyed."
  end
end
