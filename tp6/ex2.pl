:- use_module(library(lists)).

% a)

double(X, Y) :- Y is X*2.

map(_, [], []) :- [].
map(double, [H1 | T1], [H2 | T2]) :- double(H1, H2), map(double, T1, T2).

% b)

sum(A, B, S):- S is A+B.

fold(_, S, [], S).
fold(sum, S, [H | T], F) :- NewS is S + H, fold(sum, NewS, T, F).

% d)

even(X):- 0 =:= X mod 2.



% e)

ask_execute :- write('What to you want to execute? '), read(A), A.