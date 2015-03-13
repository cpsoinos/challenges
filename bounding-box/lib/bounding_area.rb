class BoundingArea

  def initialize(array_of_bounding_boxes)
    @array_of_bounding_boxes = array_of_bounding_boxes
  end

  attr_accessor :array_of_bounding_boxes

  def contains_point?(x, y)
    @array_of_bounding_boxes.any? { |box| box.contains_point?(x, y) }
  end

end
