sort_list(Input, Output) :-
  permutation(Input, Output),
  check_order(Output).
  
check_order([]).
check_order([Head]).
check_order([First, Second | Tail]) :-
  First =< Second,
  check_order([Second | Tail]).