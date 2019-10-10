require 'test_helper'

class MacrosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get macros_index_url
    assert_response :success
  end

  test "should get show" do
    get macros_show_url
    assert_response :success
  end

  test "should get new" do
    get macros_new_url
    assert_response :success
  end

  test "should get create" do
    get macros_create_url
    assert_response :success
  end

  test "should get edit" do
    get macros_edit_url
    assert_response :success
  end

  test "should get update" do
    get macros_update_url
    assert_response :success
  end

  test "should get destroy" do
    get macros_destroy_url
    assert_response :success
  end

end
