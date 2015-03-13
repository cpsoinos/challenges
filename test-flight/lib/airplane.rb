class Airplane

  def initialize(type, wingload, horsepower)
    @type = type
    @wingload = wingload
    @horsepower = horsepower
    @engine_running = false
    @flying = false
  end

  attr_accessor :type, :wingload, :horsepower, :engine_running, :flying

  def start
    if engine_running == false
      @engine_running = true
    else
      @engine_running = "airplane already started"
    end
    @engine_running
  end
  #
  def takeoff
    if engine_running == false
      @flying = "plane not started, please start"
    else
      if flying == false
        @flying = "plane takes off"
      else
        @flying = "plane is already flying!"
      end
    end
    flying
  end

  def land
    if flying == false
      @flying = "airplane already on the ground"
    else
      @flying = "landed safely"
    end
  end

  def off
    @engine_running = false
    @flying = false
  end

end
