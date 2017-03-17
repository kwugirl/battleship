require 'test_helper'

class BattleshipsControllerTest < ActionDispatch::IntegrationTest
  test "should create battleship playing board" do
    post battleship_url, params: { positions: "[[0,3], [4,8], [6,6]]" }

    expected = [[0,3],[0,2],[0,1]], [[4,8],[4,7],[4,6]], [[6,6],[6,5],[6,4]]

    assert_equal expected, BattleshipsController.board.ship_locations
  end
end
