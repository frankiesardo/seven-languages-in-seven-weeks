TwoDimList := Object clone do (
  
  dim := method(x, y,
	  self lists := list()
    for(i, 0, y - 1, self lists append(list() preallocateToSize(x)))
    self
  )
  
  set := method(x, y, value,
    self lists at(y) atInsert(x, value)
  )
  
  get := method(x, y,
    self lists at(y) at(x)
  )
  
  transpose := method(
    transposedList := TwoDimList clone dim(self lists size, self lists at(0) size)
    self lists foreach(y, subList, 
      subList foreach(x, value,
        transposedList set(y, x, value)
      )
    )
    transposedList
  ) 
  
  println := method(
    self lists foreach(subList, 
      writeln("| ", subList join (" | ") , " |")
    )
  )
  
  toFile := method(name,
    File with(name) open write(self serialized) close
  )
  
  fromFile := method(name,
    doRelativeFile(name)
  ) 
)
 
list = TwoDimList clone dim(2, 3)
 
list set(0, 0, "A")
list set(1, 0, "B")
list set(0, 1, "C")
list set(1, 1, "D")
list set(0, 2, "E")
list set(1, 2, "F")
 
transposedList := list transpose
 
transposedList toFile("transposedList.txt")
 
transposedListFromFile := TwoDimList fromFile("transposedList.txt")
 
"2x3 list:" println
list println
 
"Transposed 3x2 list:" println
transposedList println
 
"Transposed 3x2 list from file:" println
transposedListFromFile println
 
/*
 
2x3 list:
| A | B |
| C | D |
| E | F |
Transposed 3x2 list:
| A | C | E |
| B | D | F |
Transposed 3x2 list from file:
| A | C | E |
| B | D | F |
 
*/