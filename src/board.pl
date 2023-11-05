:- use_module(library(lists)).

% name_of(+Player, -Name)
% Find the Players name
:- dynamic name_of/2.

% difficulty(+Bot,-Difficulty)
% Find the Bot difficulty
:- dynamic difficulty/2.

:- dynamic board/1.

:- dynamic board_stack/1.

%########################## BOARD FUNCTIONS ##########################

% DISPLAYS THE BOARD

% Initialize the dynamic predicate with the initial game board
initialize_board :-
    retractall(board(_)),
    assertz(board([
        [empty, none, none, none, none, none, none, none],
        [empty, empty, none, none, none, none, none, none],
        [empty, empty, empty, none, none, none, none, none],
        [empty, empty, empty, empty, none, none, none, none],
        [empty, empty, empty, empty, empty, none, none, none],
        [empty, empty, empty, empty, empty, empty, none, none],
        [empty, empty, empty, empty, empty, empty, empty, none],
        [empty, empty, empty, empty, empty, empty, empty, empty]
    ])).

initialize_board_stack :-
    retractall(board_stack(_)),
    assertz(board_stack([
        [0, '  ', '  ', '  ', '  ', '  ', '  ', '  '],
        [0, 0, '  ', '  ', '  ', '  ', '  ', '  '],
        [0, 0, 0, '  ', '  ', '  ', '  ', '  '],
        [0, 0, 0, 0, '  ', '  ', '  ', '  '],
        [0, 0, 0, 0, 0, '  ', '  ', '  '],
        [0, 0, 0, 0, 0, 0, '  ', '  '],
        [0, 0, 0, 0, 0, 0, 0, '  '],
        [0, 0, 0, 0, 0, 0, 0, 0]

                                  ])).

player(playerA).
player(playerB).

show_board(Board) :- nl, show_board(Board, 21). % Start with an initial indentation of 3 spaces
show_row([]) :- nl.
show_row([Cell | Rest]) :-
    show_cell(Cell),
    write('   '), % Insert 3 spaces between cells
    show_row(Rest).

show_board([], _).
show_board([Row | Rest], Indent) :-
    indent(Indent), % Add the current level of indentation
    show_row(Row),
    NextIndent is Indent - 2, % Increase the indentation for the next row
    show_board(Rest, NextIndent).

indent(0).
indent(N) :- N > 0, write(' '), N1 is N - 1, indent(N1).



% Display each element of a list (matrix)
display_board :-
    board(Board),
    show_board(Board).

%show_board_stack(BoardStack) :- nl, maplist(show_row_stack, BoardStack), nl.
show_board_stack(Board) :- nl, show_board_stack(Board, 21). % Start with an initial indentation of 3 spaces


show_board_stack([], _).
show_board_stack([Row | Rest], Indent) :-
    indent(Indent), % Add the current level of indentation
    show_row_stack(Row),
    NextIndent is Indent - 2, % Increase the indentation for the next row
    show_board_stack(Rest, NextIndent).

show_row_stack([]) :- nl.
show_row_stack([Cell | Rest]) :-
    write(Cell),
    write('   '), % Insert 3 spaces between cells
    show_row_stack(Rest).

% Display each element of a list (matrix)
display_board_stack :-
    board_stack(BoardStack),
    show_board_stack(BoardStack).


show_cell(none) :- write(' ').
show_cell(playerA) :- write('A').
show_cell(playerB) :- write('B').
show_cell(empty) :- write('E').

displayGame :-
    display_board,
    display_board_stack.

% Decrement the value at the specified row and column
decrement_cell_value(Row, Col) :-
    board_stack(Board),
    nth0(Row, Board, OldRow),
    nth0(Col, OldRow, OldValue),
    NewValue is OldValue - 1,
    replace(OldRow, Col, NewValue, NewRow),
    replace(Board, Row, NewRow, NewBoard),
    retract(board_stack(_)),
    assertz(board_stack(NewBoard)).

% Increment the value at the specified row and column
increment_cell_value(Row, Col) :-
    board_stack(Board),
    nth0(Row, Board, OldRow),
    nth0(Col, OldRow, OldValue),
    NewValue is OldValue + 1,
    replace(OldRow, Col, NewValue, NewRow),
    replace(Board, Row, NewRow, NewBoard),
    retract(board_stack(_)),
    assertz(board_stack(NewBoard)).

% Helper predicate to replace an element in a list
replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]) :-
    I > 0,
    I1 is I - 1,
    replace(T, I1, X, R).

% Helper predicate to replace an element in a list of lists
replace([H|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]) :-
    I > 0,
    I1 is I - 1,
    replace(T, I1, X, R).


% Place a piece on the game board
place_piece(Row, Column, Piece) :-
    retract(board(Board)),
    nth0(Row, Board, OldRow),
    replace(Column, Piece, OldRow, NewRow),
    replace(Row, NewRow, Board, NewBoard),
    assertz(board(NewBoard)),
    increment_cell_value(Row, Column).

move_piece(Row1, Column1, Row2, Column2, Piece) :-
    retract(board(Board)),
    
    % Check if the stack is 1
    (stack_is_one_from(Row1, Column1) ->
        % If the stack is 1, replace the current piece with an empty cell
        ReplacementPiece1 = empty
    ;
        % If the stack is not 1, replace with the opponent's piece
        (Piece = playerA -> ReplacementPiece1 = playerB ; ReplacementPiece1 = playerA)
    ),

    (equivalence_stack(Row1, Column1, Row2, Column2) -> % Check if Val1 is equal to Val2

        % Update the board state
        nth0(Row1, Board, OldRow1),
        nth0(Column1, OldRow1, Piece),
        replace(Column1, ReplacementPiece1, OldRow1, NewRow1),
        replace(Row1, NewRow1, Board, TempBoard),
    
        nth0(Row2, TempBoard, OldRow2),
        replace(Column2, Piece, OldRow2, NewRow2),
        replace(Row2, NewRow2, TempBoard, NewBoard),
    
        % Assert the new board state
        assertz(board(NewBoard)),
        decrement_cell_value(Row1, Column1),
        increment_cell_value(Row2, Column2)
    ;
        write('Stacks do not have the same height! Try again...')
    ).


% Utility predicate to replace an element in a list with a new element
replace(Index, Element, OldList, NewList) :-
    nth0(Index, OldList, _, Temp),
    nth0(Index, NewList, Element, Temp).


% Define a predicate to calculate adjacent cells for a given row and column
adjacent_cells(Row, Column, ValidAdjacentCells) :-
    Row >= 0, Row =< 7, Column >= 0, Column =< 7, % Check if the cell is not on the edge of the board
    RowAbove is Row - 1,
    RowBelow is Row + 1,
    ColumnLeft is Column - 1,
    ColumnRight is Column + 1,
    AdjacentCells = [
        [RowAbove, ColumnLeft],
        [RowAbove, Column],
        [Row, ColumnLeft],
        [Row, ColumnRight],
        [RowBelow, Column],
        [RowBelow, ColumnRight]
    ],
    include(is_valid_adjacent_cell, AdjacentCells, ValidAdjacentCells).

% Define a predicate to check if a given adjacent cell coordinate is valid
is_valid_adjacent_cell([Row, Column]) :-
    Row >= 0, Row =< 7,
    Column >= 0, Column =< 7,
    Column =< Row.

% Predicate to check if a cell is adjacent to another cell
is_adjacent_cell(Row1, Column1, Row2, Column2) :-
    adjacent_cells(Row1, Column1, AdjacentCells),
    member([Row2, Column2], AdjacentCells).
    
stack_is_one_from(Row, Column) :-
    board_stack(BoardStack),
    nth0(Row, BoardStack, BoardStackRow),
    nth0(Column, BoardStackRow, 1).


stack_is_one_to(Row, Column) :-
    board_stack(BoardStack),
    nth0(Row, BoardStack, BoardStackRow),
    nth0(Column, BoardStackRow, 1).

equivalence_stack(Row1, Column1, Row2, Column2) :-
    board_stack(BoardStack),
    nth0(Row1, BoardStack, BoardStackRow1),
    nth0(Column1, BoardStackRow1, Val1),
    nth0(Row2, BoardStack, BoardStackRow2),
    nth0(Column2, BoardStackRow2, Val2),
    Val1 =:= Val2.

