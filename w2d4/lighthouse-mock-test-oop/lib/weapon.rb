class Weapon < Item
  attr_reader :damage, :range

  def initialize(name, weight, damage)
    super(name,weight)
    @damage = damage
    @range = 0
  end


  def hit(target)
    target.wound(@damage)
  end


end