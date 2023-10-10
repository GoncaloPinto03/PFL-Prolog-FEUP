% a)
invert(L1, L2) :- invert(L1, [], L2).
invert([], L, L).
invert([H | T], Acc, L) :- invert(T, [H | Acc], L).

% b)
del_one(E, [E | T], T).
del_one(E, [H | T], L2) :- E \= H, del_one(E, T, L), L2 = [H | L]. 

% h)

intersperse(_, [], []).
intersperse(_, [H1 | []], [H1]).
intersperse(E, [H1 | T1], L2) :- T1 \= [], intersperse(E, T1, LRem), L2 = [H1, E | LRem].
