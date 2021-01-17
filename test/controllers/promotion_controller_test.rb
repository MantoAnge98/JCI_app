require 'test_helper'

class PromotionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get promotion_index_url
    assert_response :success
  end

end
