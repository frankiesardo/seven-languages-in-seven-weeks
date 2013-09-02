toGuess := Random value(100) ceil
 
previousDiff := nil
currentDiff := nil
 
"Guess the number between 1 and 10." println
"---------------------------------" println

10 repeat (
  currentGuess := File standardInput readLine("Take a shot: ") asNumber()  
  currentDiff := (toGuess - currentGuess) abs  
  
  if(currentDiff == 0, 
  	"Well done" println
  	break
  ) 
  
  if (previousDiff == nil,
  	"Nice first try" println,
  	if (previousDiff > currentDiff,
  		"Hotter" println,
  		"Colder" println
  	)
  )
  
  previousDiff = currentDiff
)

if (currentDiff != 0, "You run out of guesses" println)