valid_board([]).
valid_board([Head|Tail]) :- valid_queen(Head), valid_board(Tail).  
valid_queen((Row, Col)) :- member(Col, [1,2,3,4,5,6,7,8]).  
    
valid_cols(Board, Cols) :- cols(Board, Cols), fd_all_different(Cols).        
cols([], []).
cols([(_, Col)|QueensTail], [Col|ColsTail]) :- 
  cols(QueensTail, ColsTail).
  
valid_diags1(Board, Diags1) :- diags1(Board, Diags1), fd_all_different(Diags1).        
diags1([], []).
diags1([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :- 
  Diagonal is Col - Row, 
  diags1(QueensTail, DiagonalsTail).
  
valid_diags2(Board, Diags2) :- diags2(Board, Diags2), fd_all_different(Diags2).         
diags2([], []).
diags2([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :- 
  Diagonal is Col + Row, 
  diags2(QueensTail, DiagonalsTail).

eight_queens(Board) :-   
  valid_board(Board), 
  valid_cols(Board, Cols), 
  valid_diags1(Board, Diags1), 
  valid_diags2(Board, Diags2),      
  print(Board).  

find_queens :- eight_queens([(1, A), (2, B), (3, C), (4, D), (5, E), (6, F), (7, G), (8, H)]).