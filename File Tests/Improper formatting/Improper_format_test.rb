#!/usr/bin/ruby

require "markup"

a = Markup.new

### Test Case  ###
# The markups.txt file is improperly formatted

puts "TEST CASE 1: INPUT AS IN EXAMPLES\n\n"

puts "Input: "
puts "1299.99, 3, \"food\""
puts "Output: "

puts a.jobMarkUp(1299.99, 3, "food")

## EXPECTED OUTPUT: markups.txt is not formatted properly
## Program exits