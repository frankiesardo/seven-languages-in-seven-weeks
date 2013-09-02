to_guess = rand(10) + 1
puts "Guess the number between 1 and 10.\n"
puts "---------------------------------\n"
 
begin
  puts "\nTake a shot: "
  guess = gets.to_i
  puts "Nah, too low" if guess < to_guess
  puts "Nah, too high" if guess > to_guess
end while guess != to_guess
 
puts "Well done sir"