# Batteries are items that can be used by robot to recharge its shield. 
# Implement Battery item that can be used to recharge the Robot’s shield.
#  Batteries have a weight of 25.

require_relative 'spec_helper'

describe Battery do

  before :each do
    @robot = Robot.new
    @battery = Battery.new
  end


   after :each do
    Robot.clear
  end


  describe ".new" do
    it "should be battery class" do
      expect(@battery).to be_a Battery
    end
  end

  describe "#recharge" do
    it "should replenish robot's shield" do
      @battery.recharge(@robot)
      expect(@robot.shield).to eql(50)
    end
  end

 

end

describe Robot do

  before :each do
    @robot = Robot.new
    @robot2 = Robot.new
    @robot3 = Robot.new
  end


  after :each do
    Robot.clear
  end


  describe ".list" do
    it "should return an array of all the robots" do
      expect(Robot.list).to include @robot, @robot2, @robot3
      puts Robot.list
    end
  end

  describe ".in_position" do

    it "should return the robots in current x,y coordinate" do
      expect(Robot.in_position(0,0)).to include @robot,@robot2,@robot3
    end
  

    it "should return a robot in specified coordinate" do
      @robot.move_up
      @robot.move_right
      expect(Robot.in_position(1,1)).to include @robot
    end
  end


  describe "#scan" do

    it "should identify if there are robots nearby" do
      @robot.move_up
      @robot2.move_right
      expect(@robot3.scan).to be true
    end
  end

  

end



