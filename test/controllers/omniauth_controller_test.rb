require "test_helper"

class OmniauthControllerTest < ActionDispatch::IntegrationTest
  test "should get passthru" do
    get omniauth_passthru_url
    assert_response :success
  end
end
