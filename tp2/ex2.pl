% given

u(1).
d(2).
d(4).
q(4).
q(16).

pairs(X, Y):- d(X), q(Y).
pairs(X, X):- u(X).

