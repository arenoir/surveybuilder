require 'test_helper'

class QuestionResponsesControllerTest < ActionController::TestCase
  setup do
    @question_response = question_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_response" do
    assert_difference('QuestionResponse.count') do
      post :create, question_response: { answer: @question_response.answer, kind: @question_response.kind, question_id: @question_response.question_id, survey_response_id: @question_response.survey_response_id }
    end

    assert_redirected_to question_response_path(assigns(:question_response))
  end

  test "should show question_response" do
    get :show, id: @question_response
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_response
    assert_response :success
  end

  test "should update question_response" do
    patch :update, id: @question_response, question_response: { answer: @question_response.answer, kind: @question_response.kind, question_id: @question_response.question_id, survey_response_id: @question_response.survey_response_id }
    assert_redirected_to question_response_path(assigns(:question_response))
  end

  test "should destroy question_response" do
    assert_difference('QuestionResponse.count', -1) do
      delete :destroy, id: @question_response
    end

    assert_redirected_to question_responses_path
  end
end
