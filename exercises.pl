% search(Elem, List)
search(H, [H|_]).
search(X, [_|T]) :- search(X, T).

% search2(Elem , List)
% looks for two consecutive occurrences of Elem
search2(X, [X, X|_]).
search2(X, [_|T]) :- search2(X, T).

% search_two(Elem, List)
% looks for two occurrences of Elem with any element in between!
% search_two(a,[b,c,a,a,d,e]). → no
% search_two(a,[b,c,a,d,a,d,e]). → yes
search_two(X, [X, _, X|_]).
search_two(X, [_|T]) :- search_two(X, T).
