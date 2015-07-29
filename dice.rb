#create a menu item that resets characters
#create a pause function to slow down the game (gets)
#weapons are store inside character class
#main program is going to be the fighting loop
#can preload charachters
#die class should be in it's own class and be required in the main program
#should have 4 seperate class file along with the main program
#so 5 files all together
#use readlines method ot read file

class Die
  #single dice is Die
  def initialize(num_sides)
    @num_sides = num_sides
  end

  def roll
    return rand(1..@num_sides)
  end
end



#d4 dice
#die object
#can change class parameter to how many side the die has
d4 = Die.new(4)

10.times do
  puts d4.roll
end