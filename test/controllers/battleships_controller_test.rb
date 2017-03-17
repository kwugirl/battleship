require 'test_helper'

class BattleshipsControllerTest < ActionDispatch::IntegrationTest
  test "should create battleship playing board" do
    post battleship_url, params: { positions: "[[0,3], [4,8], [6,6]]" }
    assert_equal "OK", @response.body

    expected = [[0,3],[0,2],[0,1]], [[4,8],[4,7],[4,6]], [[6,6],[6,5],[6,4]]

    assert_equal expected, BattleshipsController.board.ship_locations
  end

  test "should register hit on ship" do
    post battleship_url, params: { positions: "[[0,3], [4,8], [6,6]]" }
    put battleship_url, params: { x: "0", y: "1"}

    assert_equal "hit", @response.body
  end
end
