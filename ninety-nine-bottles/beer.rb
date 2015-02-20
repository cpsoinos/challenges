# YOUR CODE HERE

nbeer = 99

while nbeer > 2
  if nbeer % 10 != 0
    puts "#{nbeer} bottles of beer on the wall, #{nbeer} bottles of beer."
  else
    puts "#{nbeer} bottles of beer on the wall, #{nbeer} bottles of beer!"
  end
  nbeer = nbeer - 1
  puts "Take one down and pass it around, #{nbeer} bottles of beer on the wall."
end

puts "2 bottles of beer on the wall, 2 bottles of beer."
puts "Take one down and pass it around, 1 bottle of beer on the wall."
puts "1 bottle of beer on the wall, 1 bottle of beer."
puts "Take one down and pass it around, no more bottles of beer on the wall."
puts "No more bottles of beer on the wall, no more bottles of beer."
puts "Go to the store and buy some more, 99 bottles of beer on the wall."
