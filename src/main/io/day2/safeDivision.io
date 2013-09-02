Number originalDivision := Number getSlot("/")
Number / := method(divisor, 
  if (divisor == 0, 0, self originalDivision(divisor))
)

(3 / 2) println // 1.5 
(3 / 0) println // 0
