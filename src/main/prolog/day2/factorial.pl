%% fact(Index, Value) :- naive_fact(Index, Value).
fact(Index, Value) :- tail_recursive_fact(Index, 1, Value).

naive_fact(0, 1).
naive_fact(Index, Value) :- 
	PreviousIndex is Index - 1,
	naive_fact(PreviousIndex, PreviousValue),
	Value is PreviousValue * Index.

tail_recursive_fact(0, Accumulator, Accumulator). 
tail_recursive_fact(Index, Accumulator, Value) :-  
    NextAccumulator is Index * Accumulator, 
    NextIndex is Index -1, 
    tail_recursive_fact(NextIndex, NextAccumulator, Value). 