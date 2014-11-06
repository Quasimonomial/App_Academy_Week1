def generate_drinks(booze, mixers)
  booze.shuffle!
  mixers.shuffle!
  tasty_drinks = []
  (0...booze.length).each do |i|
    tasty_drinks << [booze[i], mixers[i]]
  end
  
  tasty_drinks
end

def grab_booze(drinks)
  booze = []
  drinks.each do |drink|
    booze << drink[0]
  end
  booze
end

def grab_mixers(drinks)
  mixer = []
  drinks.each do |drink|
    mixer << drink[1]
  end
  mixer
end

def remix(drinks)
  while true
    new_drinks = generate_drinks(grab_booze(drinks), grab_mixers(drinks))
    break if drinks_remixed?(new_drinks, drinks)
  end
  new_drinks
end

def drinks_remixed? drinks_1, drinks_2
  drinks_1.each do |tasty_drink|
    return false if drinks_2.include?(tasty_drink)
  end
  true
end


if $PROGRAM_NAME == __FILE__
  p remix([
    ["rum", "coke"],
    ["gin", "tonic"],
    ["scotch", "soda"]
  ])
end