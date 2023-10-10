% a)
list_append([], L2, L2).
list_append([H1 | T1], L2, [H1 | T3]) :- list_append(T1, L2, T3).

% b)
list_member(Elem, List) :- list_append(_Part1, [Elem | _Part2], List).
