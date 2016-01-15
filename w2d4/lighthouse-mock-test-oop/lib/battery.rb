class Battery < Item

  def initialize
    super("Battery", 25)
  end

  def recharge(target)
    target.shield = 50
  end


end