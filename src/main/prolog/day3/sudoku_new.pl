valid([]).
valid([Head|Tail]) :- fd_all_different(Head), valid(Tail).

row_position(X, Y, Position, Size) :- 
	X is Position // Size,
  Y is Position mod Size.

column_position(X, Y, Position, Size) :-
	X is Position mod Size,
  Y is Position // Size.
  			
square_position(X, Y, Position, Size) :-
	%% see http://math.stackexchange.com/questions/109712/closed-form-equation-to-figure-out-sudoku-square-from-given-Position
  Size_Sqrt is floor(sqrt(Size)),
  X is (Position mod Size // Size_Sqrt) + (Size_Sqrt * (Position // (Size * Size_Sqrt))),
  Y is (Position mod Size_Sqrt) + (Size_Sqrt * ((Position mod (Size * Size_Sqrt)) // Size)).
        
matrix_element_at_position(X, Y, List, Element) :- 
	list_element_at_position(X, List, SubList),
	list_element_at_position(Y, SubList, Element). 
	
list_element_at_position(Position, List, Element):-	OneBasedPosition is Position + 1, nth(OneBasedPosition, List, Element).   

matrix_length(Matrix, Length) :- length(Matrix, Length), submatrix_length(Matrix, Length).
submatrix_length([], _).
submatrix_length([Head | Tail], Length) :- length(Head, Length), submatrix_length(Tail, Length).
    
print_matrix([Head|Tail]) :- 
	print(Head),
  print('\n'),
  print_matrix(Tail).


sudoku(Puzzle, Solution) :-
	length(Puzzle, NumCell),
	Size is floor(sqrt(NumCell)),
  Solution = Puzzle,
                  
	fd_domain(Solution, 1, Size),
			  
	find_rows(Puzzle, Size, Rows),
	find_cols(Puzzle, Size, Cols),
	find_squares(Puzzle, Size, Squares),			  			  			 
        
  valid(Rows),
  valid(Cols),
  valid(Squares),       
        
  print_matrix(Rows).
        
        
find_rows(Puzzle, Size, Rows):- find_rows_with_index(Puzzle, Size, Rows, 0).        
find_cols(Puzzle, Size, Cols):- find_cols_with_index(Puzzle, Size, Cols, 0).        
find_squares(Puzzle, Size, Squares):- find_squares_with_index(Puzzle, Size, Squares, 0).        

find_rows_with_index([], Size, RowsMatrix, _) :- matrix_length(RowsMatrix, Size).
find_rows_with_index([Head|Tail], Size, RowsMatrix, Index) :- 
	row_position(X, Y, Index, Size),
	matrix_element_at_position(X, Y, RowsMatrix, Head),
	NewIndex is Index + 1, 
	find_rows_with_index(Tail, Size, RowsMatrix, NewIndex).	
	
find_cols_with_index([], Size, ColsMatrix, _)  :- matrix_length(ColsMatrix, Size).
find_cols_with_index([Head|Tail], Size, ColsMatrix, Index) :- 
	column_position(X, Y, Index, Size), 
  matrix_element_at_position(X, Y, ColsMatrix, Head),
	NewIndex is Index + 1, 
	find_cols_with_index(Tail, Size, ColsMatrix, NewIndex).	
	
find_squares_with_index([], Size, SquaresMatrix, _)  :- matrix_length(SquaresMatrix, Size).
find_squares_with_index([Head|Tail], Size, SquaresMatrix, Index) :- 
  square_position(X, Y, Index, Size),
  matrix_element_at_position(X, Y, SquaresMatrix, Head),
	NewIndex is Index + 1, 
	find_squares_with_index(Tail, Size, SquaresMatrix, NewIndex).	
			
			
sudoku9 :- sudoku([5, 3, _, _, 7, _, _, _, _, 
             	 6, _, _, 1, 9, 5, _, _, _, 
             	 _, 9, 8, _, _, _, _, 6, _, 
             	 8, _, _, _, 6, _, _, _, 3,
             	 4, _, _, 8, _, 3, _, _, 1,
             	 7, _, _, _, 2, _, _, _, 6,
             	 _, 6, _, _, _, _, 2, 8, _,
             	 _, _, _, 4, 1, 9, _, _, 5,
             	 _, _, _, _, 8, _, _, 7, 9], 
             	 Solution).
             	 
sudoku4 :- sudoku([_, _, 2, 3,
              _, _, _, _,
              _, _, _, _,
              3, 4, _, _],
              Solution).			
	        
  

