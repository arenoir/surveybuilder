require 'test_helper'

class CrisesControllerTest < ActionController::TestCase
  setup do
    @crisis = crises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crisis" do
    assert_difference('Crisis.count') do
      post :create, crisis: { country: @crisis.country, date: @crisis.date, name: @crisis.name }
    end

    assert_redirected_to crisis_path(assigns(:crisis))
  end

  test "should show crisis" do
    get :show, id: @crisis
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crisis
    assert_response :success
  end

  test "should update crisis" do
    patch :update, id: @crisis, crisis: { country: @crisis.country, date: @crisis.date, name: @crisis.name }
    assert_redirected_to crisis_path(assigns(:crisis))
  end

  test "should destroy crisis" do
    assert_difference('Crisis.count', -1) do
      delete :destroy, id: @crisis
    end

    assert_redirected_to crises_path
  end
end
