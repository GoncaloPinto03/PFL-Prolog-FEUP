% a) 
factorial(0, 1).

factorial(N, F) :- N > 0, Prev is N -1, factorial(Prev, R), F is R * N.

% b)
sum_rec(1, 1).
sum_rec(N, Sum) :- N > 0, Prev is N -1, sum_rec(Prev, R), Sum is R + N.

% c)
pow_rec(X, 1, X).
pow_rec(X, Y, P) :- X > 0, Y > 0, Prev is Y-1, pow_rec(X, Prev, R), P is R * X.

% e)
fibonacci(0, 0).
fibonacci(1, 1).

fibonacci(N, F) :- N > 1, N1 is N-1, N2 is N-2, fibonacci(N1, F1), fibonacci(N2, F2), F is F1 + F2.

% g)
is_prime(1).
is_prime(2).

is_prime(X) :- X > 1, \+ is_divisible(X, 2).

is_divisible(X, Y) :- X mod Y =:= 0.
is_divisible(X, Y) :- Y * Y < X,NextY is Y + 1, is_divisible(X, NextY).
