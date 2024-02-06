require "test_helper"

class SurveyResponsesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get survey_responses_new_url
    assert_response :success
  end

  test "should get create" do
    get survey_responses_create_url
    assert_response :success
  end

  test "should get thank_you" do
    get survey_responses_thank_you_url
    assert_response :success
  end

  test "should get analysis" do
    get survey_responses_analysis_url
    assert_response :success
  end
end
