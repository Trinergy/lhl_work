# Robots can start with 50 shield points. 
# When the robot is damaged it first drains the shield and then 
# starts affecting actual health.

# You will likely also have to fix previous tests 
# that will fail due to this enhancement. 
# However, focus on running spec 16 until you are done, 
# then rerun all your tests to find other failing tests and 
# modify the tests to modify their expectations.

require_relative 'spec_helper'

describe Robot do

  before :each do
    @robot = Robot.new
  end

  describe ".new" do
    it "should start with 50 shield" do
      expect(@robot.shield).to eql(50)
    end
  end

  describe "#wound" do
    it "should damage shield first before affecting hp" do
      @robot2 = Robot.new
      expect(@robot).to receive(:attack_power).and_return(60)
      @robot.attack(@robot2)
      expect(@robot2.health).to eql(90)
    end
  end


end