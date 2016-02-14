#prints message to the screen with a line break
puts "This program validates your password(123abc)"

#prints message without a line break
print "Enter the password and press Enter:"

#waits for input, storing input into the variable on the left side.
password_attempt = gets

# When the user enters their password, they'll press the enter key. It'll be saved
# as the character \n. This next line removes the last character from a
# string, effectively removing the \n character.
password_attempt.chop!


# if password matches the expected print welcome else print I do not know you

message = if password_attempt == "123abc"
            puts "Welcome"
          else
            puts "I don't know you"
          end

puts message