require 'test_helper'

class ServeyResponsesControllerTest < ActionController::TestCase
  setup do
    @servey_response = servey_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:servey_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create servey_response" do
    assert_difference('ServeyResponse.count') do
      post :create, servey_response: { participant_id: @servey_response.participant_id, type: @servey_response.type }
    end

    assert_redirected_to servey_response_path(assigns(:servey_response))
  end

  test "should show servey_response" do
    get :show, id: @servey_response
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @servey_response
    assert_response :success
  end

  test "should update servey_response" do
    patch :update, id: @servey_response, servey_response: { participant_id: @servey_response.participant_id, type: @servey_response.type }
    assert_redirected_to servey_response_path(assigns(:servey_response))
  end

  test "should destroy servey_response" do
    assert_difference('ServeyResponse.count', -1) do
      delete :destroy, id: @servey_response
    end

    assert_redirected_to servey_responses_path
  end
end
