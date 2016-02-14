require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  
  setup do
    login 'admin', 'password'
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end

end
