require 'test_helper'

class Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_categories_new_url
    assert_response :success
  end

end
