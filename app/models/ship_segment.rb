class ShipSegment
  attr_accessor :ship_front, :status

  def initialize(ship_front)
    @ship_front = ship_front
    @status = :live
  end

  def is_ship?
    true
  end
end

class NullShipSegment
  def is_ship?
    false
  end
end
