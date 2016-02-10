require_relative 'bottle_methods'

@money = ""


intro

while @user[:money] != "quit"
  prompt
  bottle_purchase(@money)
  redeem(@user[:bottles])
  left_over_caps(@user[:bottles])
  left_over_bottles(@user[:bottles])
  report
end
