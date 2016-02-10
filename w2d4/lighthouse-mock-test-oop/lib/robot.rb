class Robot


  class RobotAlreadyDeadError < StandardError
  end


  class UnattackableEnemy < StandardError
  end


  attr_reader :position, :items, :items_weight, :health, :attack_power
  attr_accessor :equipped_weapon, :shield

  @@robots = []


  def initialize
    @position = [0,0]
    @items = []
    @health = 100
    @attack_power = 5
    @equipped_weapon = nil
    @shield = 50
    @@robots << self
  end


  def self.list
    @@robots
  end


  def self.clear
    @@robots = []
  end


  def self.in_position(x, y)
    search_position = [x,y]
    robots_in_position = []
    @@robots.each do |robot|
      if robot.position == search_position
        robots_in_position << robot 
      end
    end
    robots_in_position
  end

#manually enter all potential positions
  def scan
    x = position[0]
    y = position[1]
    !Robot.in_position(x, y).empty? || !Robot.in_position(x+1, y).empty? || !Robot.in_position(x-1,y).empty? || !Robot.in_position(x,y+1).empty? || !Robot.in_position(x,y-1).empty?
  end



  def move_left
    @position[0] -= 1
  end


  def move_right
    @position[0] += 1
  end


  def move_up
    @position[1] += 1
  end


  def move_down
    @position[1] -= 1
  end


  def pick_up(item)
    if items_weight + item.weight > 250
    elsif item.is_a? BoxOfBolts
      item.feed(self) if health <= 80
    elsif item.is_a? Weapon
      @equipped_weapon = item
    else
    @items << item
    end
  end


  def items_weight
    if @items.empty?
      0
    else
      total_weight = 0
      @items.each do |item|
        total_weight += item.weight
      end
      total_weight
    end
  end


  def wound(amount)
    remaining_amount = 0
    if amount > 50
      @shield = 0
      remaining_amount = amount - 50
    else
      @shield -= amount
    end
    @health -= remaining_amount
    @health = 0 if @health <= 0
  end


  def heal(amount)
    @health += amount
    @health = 100 if @health >= 100
  end


  def heal!(amount)
    if health == 0
    raise RobotAlreadyDeadError
    else
      heal(amount)
    end
  end


  def attack(target)
    if check_position(position, target.position) 
      if equipped_weapon.nil?
        target.wound(attack_power)
      else
        @equipped_weapon.hit(target)
        if @equipped_weapon.is_a? Grenade
          @equipped_weapon = nil
        end
      end
    end
  end


  def attack!(target)
    if !target.is_a? Robot
      raise UnattackableEnemy
    elsif equipped_weapon.nil?
      target.wound(@attack_power)
    else
      @equipped_weapon.hit(target)
    end
  end

#check if enemy is nearby
  def check_position(robot1_position, robot2_position)
    x_difference = robot1_position[0].abs - robot2_position[0].abs
    y_difference = robot1_position[1].abs - robot2_position[1].abs
    range = 0 
    if @equipped_weapon.nil?
    else
      range = @equipped_weapon.range - 1
    end
    (x_difference.between?(-1 - range,1 + range) && y_difference.between?(-1 - range,1 + range)) ? true : false
  end



end






























