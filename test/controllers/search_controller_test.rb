require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get for" do
    get search_for_url
    assert_response :success
  end

  test "should get drugs" do
    get search_drugs_url
    assert_response :success
  end

  test "should get rxes" do
    get search_rxes_url
    assert_response :success
  end

end
