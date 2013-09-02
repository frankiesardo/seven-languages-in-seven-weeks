fib_recursive := method(index,
  if (index < 3, 
  	1, 
  	fib_recursive(index - 2) + fib_recursive(index -1)
  )
)

fib_iterative := method(index,
	ancestor := 0
	previous := 0
	result := 1
	for(i, 2, index, 
    ancestor = previous
    previous = result
    result = ancestor + previous
  )
  result
)
  

"\n-- Recursive Fibonacci --\n" println
for(i, 1, 10, fib_recursive(i) println)
 
"\n-- Iterative Fibonacci --\n" println
for(i, 1, 10, fib_iterative(i) println)