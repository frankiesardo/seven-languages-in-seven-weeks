List myAverage := method(
	sum := 0
	self foreach(element, 
		if(element type != "Number",
			Exception raise("#{element} is not a valid Number" interpolate),
			sum = sum + element
		)
	)
	return sum / self size
)


list(1, 2, 3, 4, 5, 6) myAverage println // 3.5
list(1, 2, 3, 4, 5, 6, "I'm a nasty Sequence") myAverage println // Exception