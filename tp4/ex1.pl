s(1).
s(2):- !.
s(3).


% a)
/*
|?- s(X).
        X = 1 ? n
        X = 2 ? n
        no
*/
 
% b)
/*
|?- s(X), s(Y).
        X = 1,
        Y = 1 ? n
        X = 1,
        Y = 2 ? n
        X = 2,
        Y = 1 ? n
        X = 2,
        Y = 2 ? n
        no
*/
 
% c)
/*
|?- s(X), !, s(Y).
        X = 1,
        Y = 1 ? n
        X = 1,
        Y = 2 ? n
        no
*/
 