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
    @height = height
    @width = width

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

  def register_shot(x, y)
    return :miss unless @grid[[x,y]].is_ship?

    ship_segment = @grid[[x,y]]
    process_hit(x,y) if ship_segment.status == :live

    ship_segment.status
  end

  private

  def place_ships(coordinates_list)
    coordinates_list.each do |coordinates|
      next unless valid_coordinates?(coordinates)

      x, y = coordinates

      # ships are 1 cell wide, 3 cells long, vertically oriented
      @grid[[x,y]] = ShipSegment.new(coordinates)
      @grid[[x,y-1]] = ShipSegment.new(coordinates)
      @grid[[x,y-2]] = ShipSegment.new(coordinates)
    end
  end

  def valid_coordinates?(coordinates)
    within_grid?(coordinates) && no_overlap?(coordinates)
  end

  #TODO: make this not rely on implicitly knowing ships are 1x3 & vertical
  def within_grid?(coordinates)
    x, y = coordinates
    (0...@width).include?(x) && (2...@height).include?(y)
  end

  #TODO: make this not rely on implicitly knowing ships are 1x3 & vertical
  def no_overlap?(ship_front)
    x, y = ship_front
    !(@grid[[x,y]].is_ship? || @grid[[x,y-1]].is_ship? || @grid[[x,y-2]].is_ship?)
  end

  def process_hit(x,y)
    @grid[[x,y]].status = :hit
  end
end
