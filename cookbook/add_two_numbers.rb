#prints message to the screen with a line break
puts "this program adds two numbers"

#prints message without a line break
print "Enter the first number and press Enter"

#waits for input, storing input into the variable on the left side.
first_number = gets

print "Enter the second number and press Enter"

second_number = gets

# When the user enters a number, they'll press the enter key. It'll be saved
# as the character \n. This next line removes the last character from a
# string, effectively removing the \n character.
first_number.chop!
second_number.chop!

#convert the entered values to integers

first_number = first_number.to_i
second_number = second_number.to_i

# Do the math and print out the result.

sum = first_number + second_number

message = "The sum of #{first_number} + #{second_number} is #{sum}"

puts message