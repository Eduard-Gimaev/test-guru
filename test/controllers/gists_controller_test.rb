require "test_helper"

class GistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gists_new_url
    assert_response :success
  end

  test "should get create" do
    get gists_create_url
    assert_response :success
  end

  test "should get edit" do
    get gists_edit_url
    assert_response :success
  end

  test "should get update" do
    get gists_update_url
    assert_response :success
  end

  test "should get destroy" do
    get gists_destroy_url
    assert_response :success
  end

  test "should get index" do
    get gists_index_url
    assert_response :success
  end

  test "should get show" do
    get gists_show_url
    assert_response :success
  end
end
