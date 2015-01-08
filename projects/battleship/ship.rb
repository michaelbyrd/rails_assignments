class Ship
  attr_accessor :length, :x, :y, :across

  def initialize(length)
    @length = length
    @placed = false
  end

  def place(x, y, across)
    if @placed
      false
    else
      @x = x
      @y = y
      @across = across
      @coords = occupied_space(@x, @y, @across)
      @shots_fired = []
      @placed = true
    end
  end

  def covers?(x,y)
    occupied_space(@x, @y, @across).include?([x,y])
  end

  def occupied_space(x, y, across)
    if across
      (x...x+self.length).to_a.map!{|xx|[xx,y]}
    else
      (y...y+self.length).to_a.map!{|yy|[x,yy]}
    end
  end

  def fire_at(x,y)
    if @coords.include?([x,y]) && !(@shots_fired.include?([x,y]))
      @shots_fired << [x,y]
    else
      false
    end
  end

  def sunk?
    @coords == @shots_fired
  end

  def overlaps_with?(ship)
    if  @coords & occupied_space(ship.x, ship.y, ship.across)  == []
      false
    else
      true
    end
  end
end
