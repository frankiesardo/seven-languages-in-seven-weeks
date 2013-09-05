%% fib(Index, Value) :- naive_fib(Index, Value).
%% fib(Index, Value) :- recursive_fib(Index, Value, Previous).
fib(Index, Value) :- tail_recursive_fib(Index, 0, 1, Value).

naive_fib(1, 1).
naive_fib(2, 1).
naive_fib(Index, Value) :- 
	PreviousIndex is Index - 1, AncestorIndex is Index - 2,
	naive_fib(PreviousIndex, Previous), naive_fib(AncestorIndex, Ancestor),
	Value is Previous + Ancestor.

recursive_fib(1, 1, 0).
recursive_fib(2, 1, 1).
recursive_fib(Index, Value, Previous) :-
	PreviousIndex is Index - 1,
	recursive_fib(PreviousIndex, Previous, Ancestor), 
	Value is Previous + Ancestor.

tail_recursive_fib(0, Accumulator, _, Accumulator).
tail_recursive_fib(Index, Ancestor, Previous, Accumulator) :- 
	PreviousIndex is Index - 1, 
	Value is Previous + Ancestor, 
	tail_recursive_fib(PreviousIndex, Previous, Value, Accumulator).