:- use_module(library(lists)).

%########################## BOARD FUNCTIONS ##########################

% DISPLAYS THE BOARD
display_board:- write('************************************************************************'),nl,
        write('*                                                                      *'),nl,
        write('*                                  __                                  *'),nl,
        write('*                               __/  \\__                               *'),nl,
        write('*                            __/  \\__/  \\__                            *'),nl,
        write('*                         __/  \\__/  \\__/  \\__                         *'),nl,
        write('*                      __/  \\__/  \\__/  \\__/  \\__                      *'),nl,
        write('*                   __/  \\__/  \\__/  \\__/  \\__/  \\__                   *'),nl,   
        write('*                __/  \\__/  \\__/  \\__/  \\__/  \\__/  \\__                *'),nl,
        write('*             __/  \\__/  \\__/  \\__/  \\__/  \\__/  \\__/  \\__             *'),nl,
        write('*            /  \\__/  \\__/  \\__/  \\__/  \\__/  \\__/  \\__/  \\            *'),nl,
        write('*            \\__/  \\__/  \\__/  \\__/  \\__/  \\__/  \\__/  \\__/            *'),nl,
        write('*                                                                      *'),nl,
        write('*                                                                      *'),nl,
        write('************************************************************************'),nl.

/*
board(  [asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc],
        [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
        [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, horizontal, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
        [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, slash, none, none, backslash, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
        [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
        [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
        [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
        [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
        [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
        [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
        [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
        [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
        [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
        [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
        [asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc, asterisc]).
*/

% Define the board
board([
  [none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, empty, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, empty, none, none, none, empty, none, none, none, none, none, none, none, none, none,none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, empty, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none]
]).

show_board(Board) :- nl, maplist(show_row, Board), nl.
show_row(Row) :- nl, maplist(show_cell, Row), nl.

show_cell(none) :- write(' ').
show_cell(zero) :- write('0').
show_cell(one) :- write('1').
show_cell(empty) :- write('E').
show_cell(asterisc) :- write('*').
show_cell(slash) :- write('/').
show_cell(backslash) :- write('\\').
show_cell(horizontal) :- write('__').


% Display each element of a list (matrix)
display_matrix :-
    board(Matrix), % Get the matrix from the fact
    show_board(Matrix).

% Display each element of a row
display_row([]).
display_row([Element|Rest]) :-
    write(Element), % Print the element
    write(' '),     % Add space to separate elements within the row
    display_row(Rest).

% Display each row of the matrix
display_matrix([]).
display_matrix([Row|Rest]) :-
    display_row(Row),
    nl, % Add a new line to separate rows
    display_matrix(Rest).



