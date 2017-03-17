class PlayingBoardTest < Minitest::Test
  def test_correctly_initialize_board_with_ships
    starting_ships = [[0,3],[4,8],[6,6]]
    board = PlayingBoard.new(starting_ships)

    expected = [[0,3],[0,2],[0,1]], [[4,8],[4,7],[4,6]], [[6,6],[6,5],[6,4]]

    assert_equal expected, board.ship_locations
  end

  #TODO: determine what correct responses for invalid inputs should be

  def test_initialize_board_with_out_of_bound_ship
  end

  def test_initialize_board_with_overlapping_ships
  end

  def test_initialize_board_with_more_than_3_ships
  end

  def test_initialize_board_with_fewer_than_3_ships
  end


  def test_register_shot_empty_space
    board = PlayingBoard.new

    assert_equal :miss, board.register_shot(0, 2)
  end

  def test_register_shot_new_hit
    board = PlayingBoard.new([[0,2]])

    assert_equal :hit, board.register_shot(0, 2)
  end

  def test_register_shot_existing_hit
    board = PlayingBoard.new([[0,2]])
    board.register_shot(0, 2)

    assert_equal :hit, board.register_shot(0, 2)
  end

  def test_register_shot_sunk_ship
    board = PlayingBoard.new([[0,2]])
    board.register_shot(0, 2)
    board.register_shot(0, 1)

    assert_equal :sunk, board.register_shot(0, 0)
    assert_equal :sunk, board.register_shot(0, 2)
    assert_equal :sunk, board.register_shot(0, 1)
    assert_equal :sunk, board.register_shot(0, 0)
  end
end
