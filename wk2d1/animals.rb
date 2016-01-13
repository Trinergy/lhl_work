module Flight
  #attr_accessor :airspeed_velocity
  def airspeed_velocity
    @airspeed_velocity
  end
  def airspeed_velocity=(velocity)
    @airspeed_velocity = velocity
  end

  def fly
    puts "I am a #{@species}! I am flying at #{@airspeed_velocity}km/hr!"
  end
end



class Animal
  attr_accessor :name, :hair, :warm_blooded
  


  def initialize(name, hair, warm_blooded)
    @name = name
    @hair = hair
    @warm_blooded = warm_blooded
  end

  def move(number)
    "#{@name} moves #{number} meters "
  end


end



class Mammal < Animal

  def initialize(name, hair)
    super(name, hair, true)
  end
end


class Amphibian < Animal

  def initialize(name)
    super(name, false, false)
  end
end

class Primate < Mammal

  def initialize(name)
    super(name, true)
  end
end



class Frog < Amphibian

  def move(number)
    super(number) + "by swimming."
  end
end


class Bat < Mammal
  include Flight

  def initialize(name)
    super(name, true)
    @species = "bat"
    @airspeed_velocity = rand(20) + 10
  end

  def move(number)
    super(number) + "by flying."
  end

end


class Parrot < Mammal
  include Flight
  def initialize(name)
    super(name, true)
    @species = "parrot"
    @airspeed_velocity = rand(10) + 10
  end

  def move(number)
    super(number) + "by flying."
  end
end


class Chimpanzee < Primate

  def move(number)
    super(number) + "by walking."
  end
end

