:- dynamic male/1, female/1.
:- dynamic parent/2.

% EX 1 from the TP1

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

% a)

% :- dynamic male/1, female/1. -> defined before the predicates

aux(male, N) :- assert(male(N)).
aux(female, N) :- assert(female(N)).

add_person(G, N) :- write('Gender: '), read(G), nl, write('Name: '), read(N), P =.. [G, N], P, !, write('This person already exists!'), fail.
add_person(G, N) :- aux(G, N).

% b)

% :- dynamic parent/2. -> defined before the predicates

add_parents(Person, Parent1, Parent2) :- write('Person: '), read(Person), nl, write('Parent1: '), read(Parent1), nl, write('Parent2: '), read(Parent2),
                                         S1 =.. [parent, Parent1, Person], S1, !, write('Parent1 is a parent of Person already!'), fail,
                                         S2 =.. [parent, Parent2, Person], S2, !, write('Parent2 is a parent of Person already!'), fail.
add_parents(Person, Parent1, Parent2) :- assert(parent(Parent1, Person)), assert(parent(Parent2, Person)).

% c)

aux_gender(N) :- male(N), retract(male(N)).
aux_gender(N) :- female(N), retract(female(N)).

remove_person :- write('Name: '), read(N), aux_gender(N),retractall(parent(_, N)), retractall(parent(N, _)). 

