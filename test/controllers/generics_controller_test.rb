require 'test_helper'

class GenericsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get generics_new_url
    assert_response :success
  end

  test "should get create" do
    get generics_create_url
    assert_response :success
  end

  test "should get index" do
    get generics_index_url
    assert_response :success
  end

  test "should get update" do
    get generics_update_url
    assert_response :success
  end

  test "should get edit" do
    get generics_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get generics_destroy_url
    assert_response :success
  end

end
