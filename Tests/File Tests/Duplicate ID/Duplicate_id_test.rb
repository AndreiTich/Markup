#!/usr/bin/ruby

require "markup"

a = Markup.new

### Test Case  ###
# The markups.txt file contains a duplicate material ID

puts "TEST CASE 1: INPUT AS IN EXAMPLES\n\n"

puts "Input: "
puts "1299.99, 3, \"food\""
puts "Output: "

puts a.jobMarkUp(1299.99, 3, "food")

## EXPECTED OUTPUT: ID "634" exists more than once in markups.txt
## Program exits
