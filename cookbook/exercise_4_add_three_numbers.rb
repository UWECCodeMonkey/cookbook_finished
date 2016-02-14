#prints message to the screen with a line break
puts "This program adds three numbers"

numbers = [0,1,2]
sum = 0

numbers.each do |number|
  print "Enter number #{number+1} and press Enter:"
  newNumber = gets
  newNumber.chop!
  numbers[number] = newNumber.to_i
  sum = sum + newNumber.to_i
end

message = "The sum of #{numbers[0]} + #{numbers[1]} + #{numbers[2]} is #{sum}"

puts message