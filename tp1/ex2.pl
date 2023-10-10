% info given

teaches(algorithms, adalberto).
teaches(databases, bernardete).
teaches(compilers, capitolino).
teaches(statistics, diogenes).
teaches(networks, ermelinda).

attends(algorithms, alberto).
attends(algorithms, bruna).
attends(algorithms, cristina).
attends(algorithms, diogo).
attends(algorithms, eduarda).

attends(databases, antonio).
attends(databases, bruno).
attends(databases, cristina).
attends(databases, duarte).
attends(databases, eduardo).

attends(compilers, alberto).
attends(compilers, bernardo).
attends(compilers, clara).
attends(compilers, diana).
attends(compilers, eurico).

attends(statistics, antonio).
attends(statistics, bruna).
attends(statistics, cláudio).
attends(statistics, duarte).
attends(statistics, eva).

attends(networks, alvaro).
attends(networks, beatriz).
attends(networks, claudio).
attends(networks, diana).
attends(networks, eduardo).

% rules

student(X, Y) :- attends(UC, X), teaches(UC, Y).

teacher(X, Y) :- student(Y, X).

colleagues(X, Y) :- attends(UC, X), attends(UC, Y), (X \= Y).
colleagues(X, Y) :- teacher(X, _), teacher(Y, _), (X \= Y).

attends_more_than_1(X) :- attends(P1, X), attends(P2, X), (P1 \= P2). 

% b)
/*
i) teaches(X, diogenes).
ii) teaches(X, felismina).
iii) ...
iv)
v)
vi)
 */
