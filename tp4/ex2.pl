data(one).
data(two).
data(three).
cut_test_a(X):- data(X).
cut_test_a('five').
cut_test_b(X):- data(X), !.
cut_test_b('five').
cut_test_c(X, Y):- data(X), !, data(Y).
cut_test_c('five', 'five').

% a)
/*
|?- cut_test_a(X), write(X), nl, fail.
        one
        two
        three
        five
        no
*/
 
% b)
/*
|?- cut_test_b(X), write(X), nl, fail.
        one
        no
*/
 
% c)
/*
|?- cut_test_c(X, Y), write(X-Y), nl, fail.
        one-one
        one-two
        one-three
        no
*/
 