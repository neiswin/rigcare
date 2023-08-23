require "test_helper"

class FaqControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get faq_index_url
    assert_response :success
  end

  test "should get new" do
    get faq_new_url
    assert_response :success
  end

  test "should get edit" do
    get faq_edit_url
    assert_response :success
  end

  test "should get update" do
    get faq_update_url
    assert_response :success
  end

  test "should get destroy" do
    get faq_destroy_url
    assert_response :success
  end
end
