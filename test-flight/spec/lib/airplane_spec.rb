require_relative "../../lib/airplane"

describe Airplane do

  my_plane = Airplane.new("cesna", 10, 150)

  describe "#initialization" do
    it "correctly initializes airplane" do
      expect(my_plane.type).to eq("cesna")
      expect(my_plane.wingload).to eq(10)
      expect(my_plane.horsepower).to eq(150)
    end
  end

  describe "#start" do

    context "plane is off" do
      it "returns 'airplane started'" do
        expect(my_plane.start).to eq(true)
      end
    end

    context "plane is already on" do
      it "returns 'airplane was already started'" do
        expect(my_plane.start).to eq("airplane already started")
      end
    end
  end

  describe "#takeoff" do

    context "plane is off" do
      it "returns 'plane not started, please start'" do
        my_plane = Airplane.new("cesna", 10, 150)
        expect(my_plane.engine_running).to eq(false)
        expect(my_plane.takeoff).to eq("plane not started, please start")
      end
    end

    context "plane is on and not flying" do
      it "returns 'plane takes off'" do
        my_plane = Airplane.new("cesna", 10, 150)
        my_plane.start
        expect(my_plane.engine_running).to eq(true)
        expect(my_plane.takeoff).to eq("plane takes off")
      end
    end

    context "plane is on and already flying" do
      my_plane = Airplane.new("cesna", 10, 150)
      my_plane.takeoff
      it "returns 'plane is already flying'" do
        expect(my_plane.takeoff).to eq("plane is already flying!")
      end
    end
  end

  describe "#land" do

    context "plane is flying" do
      my_plane = Airplane.new("cesna", 10, 150)
      it "returns 'plane landed safely'" do
        my_plane.takeoff
        expect(my_plane.land).to eq("landed safely")
      end
    end

    context "plane is not flying" do
      it "returns 'plane is already on the ground'" do
        my_plane = Airplane.new("cesna", 10, 150)
        expect(my_plane.land).to eq("airplane already on the ground")
      end
    end
  end

end
