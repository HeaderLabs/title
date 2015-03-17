require 'test_helper'

module Title
  class AppControllerTest < ActionController::TestCase
    test "should get show" do
      get :show
      assert_response :success
    end

  end
end
