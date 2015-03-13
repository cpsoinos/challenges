class BoundingBox

  def initialize(left, bottom, width, height)
    @left   = left
    @bottom = bottom
    @width  = width
    @height = height
  end

  attr_accessor :left, :bottom, :width, :height

  def right
    left + width
  end

  def top
    bottom + height
  end

  def contains_point?(x,y)
    x >= left   &&
    x <= right  &&
    y >= bottom &&
    y <= top
  end

end
