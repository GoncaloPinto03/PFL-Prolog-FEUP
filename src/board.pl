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
        [playerA, playerB, none, none, none, none, none, none],
        [empty, empty, empty, none, none, none, none, none],
        [playerA, empty, playerB, empty, none, none, none, none],
        [empty, empty, empty, empty, empty, none, none, none],
        [empty, playerB, empty, empty, empty, empty, none, none],
        [empty, empty, empty, empty, playerA, empty, empty, none],
        [empty, empty, empty, empty, empty, empty, empty, empty]
    ])).

initialize_board_stack :-
    retractall(board_stack(_)),
    assertz(board_stack([
        [0, '  ', '  ', '  ', '  ', '  ', '  ', '  '],
        [1, 1, '  ', '  ', '  ', '  ', '  ', '  '],
        [0, 0, 0, '  ', '  ', '  ', '  ', '  '],
        [1, 0, 1, 0, '  ', '  ', '  ', '  '],
        [0, 0, 0, 0, 0, '  ', '  ', '  '],
        [0, 1, 0, 0, 0, 0, '  ', '  '],
        [0, 0, 0, 0, 1, 0, 0, '  '],
        [0, 0, 0, 0, 0, 0, 0, 0]

                                  ])).

player(playerA).
player(playerB).
player(bot).

% Define the current player
current_player(P) :- player(P).

show_board(Board) :- nl, maplist(show_row, Board), nl.
show_row([]) :- nl.
show_row([Cell | Rest]) :-
    show_cell(Cell),
    write('   '), % Insert 3 spaces between cells
    show_row(Rest).

% Display each element of a list (matrix)
display_board :-
    board(Board),
    show_board(Board).

show_board_stack(BoardStack) :- nl, maplist(show_row_stack, BoardStack), nl.

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
show_cell(asterisc) :- write('*').
show_cell(arrow) :- write('-').

show_cell(zero) :- write('0').
show_cell(one) :- write('1').
show_cell(two) :- write('2').
show_cell(three) :- write('3').
show_cell(four) :- write('4').
show_cell(five) :- write('5').
show_cell(six) :- write('6').
show_cell(seven) :- write('7').
show_cell(eight) :- write('8').
show_cell(nine) :- write('9').
show_cell(ten) :- write('10').
show_cell(eleven) :- write('11').
show_cell(twelve) :- write('12').
show_cell(thirteen) :- write('13').
show_cell(fourteen) :- write('14').
show_cell(fifteen) :- write('15').
show_cell(sixteen) :- write('16').
show_cell(seventeen) :- write('17').
show_cell(eighteen) :- write('18').
show_cell(nineteen) :- write('19').
show_cell(twenty) :- write('20').


piece_info(player1, playerA).
piece_info(player2, playerB).


displayGame :-
    display_board,
    display_board_stack.
   

validPlayer(playerA).
validPlayer(playerB).

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

% Move a piece from a position on another on the game board
move_piece(Row1, Column1, Row2, Column2, Piece) :-
    retract(board(Board)),
    nth0(Row2, Board, OldRow2),
    nth0(Column1, OldRow1, Piece), % Check if the piece at (Row1, Column1) is the player's piece
    replace(Column1, empty, OldRow1, NewRow1), % Replace the old position with an empty space
    replace(Row1, NewRow1, Board, TempBoard),
    assertz(board(TempBoard)),
    replace(Column2, Piece, OldRow2, NewRow2), % Place the piece at the new position
    replace(Row2, NewRow2, Board, NewBoard), % Update the board
    assertz(board(NewBoard)),
    decrement_cell_value(Row1, Column1),
    increment_cell_value(Row2, Column2).


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

