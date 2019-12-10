require 'test_helper'

class LobbyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lobby_index_url
    assert_response :success
  end

  test "should get show" do
    get lobby_show_url
    assert_response :success
  end

end
