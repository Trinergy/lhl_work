require 'colorize'

@user = {
  money: "",
  bottles: 0,
  redeemed: 0,
  leftover_caps: 0,
  leftover_bottles: 0,
}

def prompt
  puts "How many Washingtons you bankin? bruh.".blue
  @user[:money] = gets.chomp 
end


def intro
  puts "Hello, I hear you got some bottles poppin'\b
  type 'quit' to exit program."
end


def bottle_purchase(money)
  @user[:bottles] = @user[:money].to_i / 2
end


def redeem(bottles)
  @bottle_redemp = bottles / 2
  @cap_redemp = bottles / 4
  @user[:redeemed] = @bottle_redemp + @cap_redemp
end


def left_over_caps(bottles)
  @user[:leftover_caps] = bottles % 2
end


def left_over_bottles(bottles)
  @user[:leftover_bottles] = bottles % 4
end


def report
  total = @user[:bottles] + @user[:redeemed]
  puts "You have purchased #{@user[:bottles]} bottles.\b
  You have obtained #{@user[:redeemed]} bottles through recycling.\b
  You now have a total of #{total} bottles.\b
  #{@cap_redemp} was obtained through cap recycling.\b
  #{@bottle_redemp} was obtained through bottle recycling.\b
  #{@user[:leftover_caps]} caps are leftover.
  #{@user[:leftover_bottles]} bottles are leftover".green
end