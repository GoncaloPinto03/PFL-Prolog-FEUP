% genders

%female
female(grace).
female(dede).
female(gloria).
female(barb).
female(claire).
female(pameron).
female(haley).
female(alex).
female(lily).
female(poppy).

% male
male(frank).
male(jay).
male(javier).
male(merle).
male(phil).
male(mitchell).
male(joe).
male(manny).
male(cameron).
male(bo).
male(dylan).
male(luke).
male(rexford).
male(calhoun).
male(george).

% parents
parent(grace, phil).
parent(frank, phil).

parent(dede, claire).
parent(jay, claire).
parent(dede, mitchell).
parent(jay, mitchell).

parent(jay, joe).
parent(gloria, joe).

parent(gloria, manny).
parent(javier, manny).

parent(barb, cameron).
parent(merle, cameron).
parent(barb, pameron).
parent(merle, pameron).

parent(phil, haley).
parent(claire, haley).
parent(phil, alex).
parent(claire, alex).
parent(phil, luke).
parent(claire, luke).

parent(mitchell, lily).
parent(cameron, lily).
parent(mitchell, rexford).
parent(cameron, rexford).

parent(pameron, calhoun).
parent(bo, calhoun).

parent(dylan, george).
parent(haley, george).
parent(dylan, poppy).
parent(haley, poppy).

% rules

father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).


grandfather(X, Y) :- father(X, Z), parent(Z, Y).
grandmother(X, Y) :- mother(X, Z), parent(Z, Y).

siblings(X, Y) :- parent(D, X), parent(M, X), parent(D, Y), parent(M, Y), (X \= Y), (D \= M).  

halfsiblings(X, Y) :- parent(Px, X), parent(Py, Y), (X \= Y), Px \= Py, (father(Px, X) ; mother(Px, X)), (father(Py, Y) ; mother(Py, Y)).

cousins(X, Y) :- parent(P1, X), parent(P2, Y), siblings(P1, P2).

uncle(X, Y) :- siblings(X, P), parent(P, Y), male(X).

marriage(jay, gloria, 2008).
marriage(jay, dede, 2008).
divorce(jay, gloria, 2003).

