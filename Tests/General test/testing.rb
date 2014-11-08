#!/usr/bin/ruby

require "markup"

a = Markup.new

### Test Case 1 ###
# Input as shown in examples

puts "TEST CASE 1: INPUT AS IN EXAMPLES\n\n"

puts "Input: "
puts "1299.99, 3, \"food\""
puts "Output: "

puts a.jobMarkUp(1299.99, 3, "food")

puts "Expected Output: 1591.58"

puts "\n"
puts "Input: "
puts "5432.00, 1, \"drugs\""
puts "Output: "

puts a.jobMarkUp(5432.00, 1, "drugs").to_s

puts "Expected Output: 6199.81"

puts "\n"
puts "Input: "
puts "12456.95, 4, \"books\""
puts "Output: "

puts a.jobMarkUp(12456.95, 4, "books").to_s

puts "Expected Output: 13707.63"

puts "\n"

### Test Case 2 ###
# Improper input types

puts "TEST CASE 2: IMPROPER INPUT TYPES\n\n"

puts "Input: "
puts "\"1299.99\", 3, \"food\""
puts "Output: "

puts a.jobMarkUp("1299.99", 3, "food")

puts "Expected Output: ArgumentError: Base price must be numeric"

puts "\n"
puts "Input: "
puts "1299.99, [3], \"food\""
puts "Output: "

puts a.jobMarkUp(1299.99, [3], "food")

puts "Expected Output: ArgumentError: workers must be Integer"

puts "\n"
puts "Input: "
puts "1299.99, 3, 3.54"
puts "Output: "

puts a.jobMarkUp(1299.99, 3, 3.54)

puts "Expected Output: ArgumentError: material must be Integer or string"