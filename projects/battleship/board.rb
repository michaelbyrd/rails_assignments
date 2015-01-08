class Board
  def initialize
    @ships = []
  end

  def has_ship_on?(x, y)
    @ships.any? do |ship|
      ship.covers?(x, y)
    end
  end

  def occupied_board_locations
  end

  def place_ship(ship, x, y, across)
    ship.place(x,y,across)
    if @ships.any? {|s| s.overlaps_with?(ship) }
      false
    else
      @ships << ship
    end
  end

end
