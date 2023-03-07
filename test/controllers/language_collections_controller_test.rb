require "test_helper"

class LanguageCollectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get language_collections_create_url
    assert_response :success
  end

  test "should get destroy" do
    get language_collections_destroy_url
    assert_response :success
  end
end
