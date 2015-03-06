require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { address: @event.address, address_2: @event.address_2, city: @event.city, end_datetime: @event.end_datetime, max_registrants: @event.max_registrants, name: @event.name, registration_close_datetime: @event.registration_close_datetime, registration_open_datetime: @event.registration_open_datetime, start_datetime: @event.start_datetime, state: @event.state, zip_code: @event.zip_code }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { address: @event.address, address_2: @event.address_2, city: @event.city, end_datetime: @event.end_datetime, max_registrants: @event.max_registrants, name: @event.name, registration_close_datetime: @event.registration_close_datetime, registration_open_datetime: @event.registration_open_datetime, start_datetime: @event.start_datetime, state: @event.state, zip_code: @event.zip_code }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
