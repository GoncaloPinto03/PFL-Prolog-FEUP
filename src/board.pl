:- use_module(library(lists)).

% name_of(+Player, -Name)
% Find the Players name
:- dynamic name_of/2.

% difficulty(+Bot,-Difficulty)
% Find the Bot difficulty
:- dynamic difficulty/2.

:- dynamic board/1.

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

player(playerA).
player(playerB).

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
show_cell(twenty_one) :- write('21').
show_cell(twenty_two) :- write('22').
show_cell(twenty_three) :- write('23').
show_cell(twenty_four) :- write('24').
show_cell(twenty_five) :- write('25').
show_cell(twenty_six) :- write('26').
show_cell(twenty_seven) :- write('27').
show_cell(twenty_eight) :- write('28').
show_cell(twenty_nine) :- write('29').
show_cell(thirty) :- write('30').
show_cell(thirty_one) :- write('31').
show_cell(thirty_two) :- write('32').
show_cell(thirty_three) :- write('33').
show_cell(thirty_four) :- write('34').
show_cell(thirty_five) :- write('35').
show_cell(thirty_six) :- write('36').

piece_info(player1, playerA).
piece_info(player2, playerB).


displayGame :-
    display_board.


validPlayer(playerA).
validPlayer(playerB).


% Place a piece on the game board
place_piece(Row, Column, Piece) :-
    retract(board(Board)),
    nth0(Row, Board, OldRow),
    replace(Column, Piece, OldRow, NewRow),
    replace(Row, NewRow, Board, NewBoard),
    assertz(board(NewBoard)).

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

