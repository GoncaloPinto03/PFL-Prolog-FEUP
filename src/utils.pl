:- use_module(library(between)).

% get_line(-Result,+Acc)
% Unifies Result with an input line up to endline '\n'
get_line(Result, Acc):-
    get_char(Char),
    Char \= '\n',
    append(Acc, [Char], Acc1),
    get_line(Result, Acc1).
get_line(Result, Acc):-
    atom_chars(Result, Acc).

% get_name(+Player)
% Asks player name. Dynamically adds the name_of/2 fact to the base fact
get_name(Player):-
    format('Hello ~a, what is your name? ', [Player]),
    get_line(Name, []),
    asserta(name_of(Player, Name)).