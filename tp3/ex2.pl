:-use_module(library(lists)).

% a)
list_size(List, Size) :- length(List, Size).

% b)
list_sum([], 0).
list_sum([H | T], S) :- list_sum(T, ST),
                        S is ST + H.

% c)
list_prod([], 1).
list_prod([H | T], P) :- list_prod(T, ST),
                        P is ST * H.

% d)
inner_product([], [], 0).
inner_product([H1 | T1], [H2 | T2], R) :- inner_product(T1, T2, ST), R is (ST + (H1 * H2)).

% e)
count(_, [], 0).
count(E, [E | T], N) :- count(E, T, NT),
                        N is NT + 1.
count(E, [H | T], N) :- H =\= E,
                        count(E, T, N).