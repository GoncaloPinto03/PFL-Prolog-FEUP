% <INFO GIVEN>

% pilots
pilot(lamb).
pilot(besenyei).
pilot(chambliss).
pilot(maclean).
pilot(mangold).
pilot(jones).
pilot(bonhomme).

% teams
team(lamb, breitling).
team(besenyei, redbull).
team(chambliss, redbull).
team(maclean, mediterranean).
team(mangold, cobra).
team(jones, matador).
team(bonhomme, matador).

% planes
plane(lamb, mx2).
plane(besenyei, edge540).
plane(chambliss, edge540).
plane(maclean, edge540).
plane(mangold, edge540).
plane(jones, edge540).
plane(bonhomme, edge540).

% circuits
circuit(istanbul).
circuit(budapeste).
circuit(porto).

% race winners
winner(jones, porto).
winner(mangold, budapeste).
winner(mangold, istanbul).

% nº of gates
gates(istanbul, 9).
gates(budapeste, 6).
gates(porto, 5).

team_won(T, C) :- winner(A, C), team(A, T).


% b) queries

/*
i. winner(X, porto).
ii. team_won(T, porto).
iii. gates(X, 9).
iv. plane(P, _A), _A \= edge540.
v. winner(P, _C1), winner(P, _C2), (_C1 \= _C2).
vi. plane(_P, X), winner(_P, porto).
 */

