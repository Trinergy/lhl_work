#brute force
def total(ft,colors)
  color_price = colors <= 2 ? (colors * 10) : (((colors - 2) * 15) + 20)
  measure = ft * 15
  print (color_price + measure) * 1.15
end

total(1,2)

# can make more robust by asking to specify price paramaters instead
# of pre-setting it in the code