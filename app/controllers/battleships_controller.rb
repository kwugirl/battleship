class BattleshipsController < ApplicationController
  cattr_accessor :board
  @@board = PlayingBoard.new

  skip_before_action :verify_authenticity_token

  # Feel free to use a class variable, cache or other form of storage to solve this problem.
  # In our production code we avoid maintaining state in the controller. However for this
  # exercise it's ok to use a class variable. We're more interested in other aspects of your
  # solution. We promise not to judge you for using a class variable if you don't judge us too
  # harshly for having a problem that encourages it.

  def create
    positions = JSON.parse(params['positions'])

    @@board = PlayingBoard.new(positions)

    render plain: "OK"
  end

  def update
    x = params['x'].to_i
    y = params['y'].to_i

    result = @@board.register_shot(x,y)

    render plain: result
  end
end
