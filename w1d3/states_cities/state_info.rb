#checked
@states = {
  OR: 'Oregon',
  FL: 'Florida',
  CA: 'California',
  NY: 'New York',
  MI: 'Michigan',
  NJ: 'New Jersy',
  CT: 'Connecticut'
}

@cities = {
  OR: ['Portland', 'Eugene', 'Salem'],
  FL: ['Jacksonville', 'Miami', 'Tampa', 'Orlando'],
  CA: ['Los Angeles', 'San Diego', 'San Francisco'],
  NY: ['Buffalo', 'Rochester', 'Yonkers'],
  MI: ['Detroit', 'Grand Rapids', 'Lansing'],
  NJ: ['Newark', 'Jersey City'],
  CT: ['Bridgeport', 'New Haven', 'Hartford']
}

@taxes = {
  OR: 7.5,
  FL: 20,
  CA: 30,
  NY: 42,
  MI: 12,
  NJ: 4,
  CT: 6
}

def describe_state(state)
  full_state = @states[state]
  state_count = @cities[state].length
  maj_cities = @cities[state].join(', ')

  puts "#{state} is for #{full_state}. It has #{state_count} major cities: #{maj_cities}."
end

describe_state(:CA)

def calculate_tax(state, dollar)
  if !@states.include?(state)
    puts "You entered wrong."
    return
  end
  place = @states[state]
  tax_rate = @taxes[state]
  tax_amount = ((tax_rate * 0.01) * dollar).round(2)
  puts "Tax rate in #{place} is #{tax_rate}%. Your $#{dollar} will be taxed $#{tax_amount}."
end

calculate_tax(:CA, 24)
calculate_tax("wr", 23)


def find_state_for_city(city)
  city_want = city
  state_want = nil
  @cities.each do |state, cities|
    cities.each do |city|
      if city_want == city
        state_want = state
      end
    end
  end
  puts " Your city is in #{state_want}."
end

find_state_for_city('New Haven')

find_state_for_city('Buffalo')

