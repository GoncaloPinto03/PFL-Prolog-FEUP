:- use_module(library(lists)).

%########################## BOARD FUNCTIONS ##########################

% DISPLAYS THE BOARD

% Define the board
board([
  [none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, zero, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, one, arrow, empty, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none,asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, two, arrow, empty, none, none, none, three, arrow, empty, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, four, arrow, empty, none, none, none, five, arrow, empty, none, none, none, six, arrow, empty, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, seven, arrow, empty, none, none, none, eight, arrow, empty, none, none, none, nine, arrow, empty, none, none, ten, arrow, empty, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, eleven, arrow, empty, none, none, twelve, arrow, empty, none, none, thirteen, arrow, empty, none, none, fourteen, arrow, empty, none, none, fifteen, arrow, empty, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, sixteen, arrow, empty, none, none, seventeen, arrow, empty, none, none, eighteen, arrow, empty, none, none, nineteen, arrow, empty, none, none, twenty, arrow, empty, none, none, twenty_one, arrow, empty, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, twenty_two, arrow, empty, none, none, twenty_three, arrow, empty, none, none, twenty_four, arrow, empty, none, none, twenty_five, arrow, empty, none, none, twenty_six, arrow, empty, none, none, twenty_seven, arrow, empty, none, none, twenty_eight, arrow, empty, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, none, zero, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, twenty_nine, arrow, empty, none, none, thirty, arrow, empty, none, none, thirty_one, arrow, empty, none, none, thirty_two, arrow, empty, none, none, thirty_three, arrow, empty, none, none, thirty_four, arrow, empty, none, none, thirty_five, arrow, empty, none, none, thirty_six, arrow, empty, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [asterisc, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, none, asterisc],
  [none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none, asterisc, none, none]
]).

show_board(Board) :- nl, maplist(show_row, Board), nl.
show_row(Row) :- maplist(show_cell, Row), nl.

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



% Display each element of a list (matrix)
display_board :-
    board(Board),
    show_board(Board).
