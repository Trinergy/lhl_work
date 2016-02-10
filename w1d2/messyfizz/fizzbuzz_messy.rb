def fizzbuzz(first, last)
    first.upto(last) do |number|
      #divisble by 15 mathematically divisible by both 3 and 5
      if number % 15 == 0
        puts "FizzBuzz"
      elsif number % 3 == 0
        puts "Fizz"
      elsif number % 5 == 0
        puts "Buzz"
      else
        puts number
      end
    end
  end

fizzbuzz(1,15)