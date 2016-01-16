require_relative 'spec_helper'

describe Robot do

  before :each do
    @robot1 = Robot.new
    @robot2 = Robot.new
    @item = Item.new("Poop", 1)
  end


  describe "#heal!" do
    it "should throw error if robot hp is already dead (hp at 0)" do
      expect(@robot1).to receive(:health).and_return(0)
      expect {@robot1.heal!(30)}.to raise_error Robot::RobotAlreadyDeadError
    end
  end


  describe "#attack!" do
    it "should attack and deal 5 damage" do
      @robot1.attack!(@robot2)
      expect(@robot2.shield).to eql(45)
    end

    it "should throw error if target is not a robot" do
      expect {@robot1.attack!(@item)}.to raise_error Robot::UnattackableEnemy
    end
  end

end
