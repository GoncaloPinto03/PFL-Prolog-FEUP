% a)
print_n(0, _) .
print_n(N, S):- N > 0, Next is N-1, write(S), print_n(Next, S).

% b)
print_string("").
print_string([Code | T]) :- char_code(Char, Code),
                            write(Char),
                            print_string(T).
print_text(T, S, P) :- print(S), print_n(P,' '), print_string(T), print_n(P,' '), print(S).

% c)
print_line(T, S, P) :- length(T, Len), W is Len+P*2+2, print_n(W, S).
print_white_line(T, S, P) :- length(T, Len), W is Len+P*2, print(S), print_n(W,' '), print(S).

print_banner(T, S, P) :- print_line(T, S, P), nl, print_white_line(T,S ,P), nl, print_text(T, S, P), nl, print_white_line(T, S, P), nl, print_line(T, S, P).
