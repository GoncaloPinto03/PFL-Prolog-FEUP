% without cut
max(X, X, X) .
max(X, Y, X) :- X > Y .
max(X, Y, Y) :- X < Y .

max(X ,Y ,Z ,R) :- max(X,Y,T), max(T,Z,R).

% with cut
max2(A, B, C, A) :- A >= B, A >= C, !.
max2(A, B, C, B) :- B >= A, B >= C, !.
max2(A, B, C, C) :- C >= A, C >= B, !. 