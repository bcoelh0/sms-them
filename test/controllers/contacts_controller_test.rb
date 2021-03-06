require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get contacts_create_url
    assert_response :success
  end

  test "should get update" do
    get contacts_update_url
    assert_response :success
  end

  test "should get edit" do
    get contacts_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get contacts_destroy_url
    assert_response :success
  end

end
