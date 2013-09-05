rev(List1, List2) :- rev(List1, [], List2).

rev([], Accumulator, Accumulator).
rev([Head|Tail], Accumulator, List2) :- 
	rev(Tail, [Head|Accumulator], List2).