require 'ship_segment'

class PlayingBoard
  attr_accessor :grid

  def initialize(ship_locations = [], height: 10, width: 10)
    blank_grid = {}
    (0...width).each do |x|
      (0...height).each do |y|
        blank_grid[[x,y]] = NullShipSegment.new
      end
    end
    @grid = blank_grid

    place_ships(ship_locations)
  end

  def ship_locations
    ship_fronts = grid.select {|coordinates, v| v.is_ship? && coordinates == v.ship_front }

    locations = []
    ship_fronts.keys.sort.each do |coordinates|
      #TODO: make this not rely on implicitly knowing ships are 1x3 & vertical
      x, y = coordinates
      locations << [coordinates, [x,y-1], [x,y-2]]
    end

    locations
  end

  private

  def place_ships(coordinates_list)
    coordinates_list.each do |coordinates|
      x, y = coordinates

      # ships are 1 cell wide, 3 cells long, vertically oriented
      @grid[[x,y]] = ShipSegment.new(coordinates)
      @grid[[x,y-1]] = ShipSegment.new(coordinates)
      @grid[[x,y-2]] = ShipSegment.new(coordinates)
    end
  end
end
