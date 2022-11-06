% search(Elem, List)
search(E, [E|_]).
search(E, [_|T]) :- search(E, T).

% search2(Elem , List)
% looks for two consecutive occurrences of Elem
search2(E, [E, E|_]).
search2(E, [_|T]) :- search2(E, T).

% search_two(Elem, List)
% looks for two occurrences of Elem with any element in between!
% search_two(a,[b,c,a,a,d,e]). → no
% search_two(a,[b,c,a,d,a,d,e]). → yes
search_two(E, [E, _, E|_]).
search_two(E, [_|T]) :- search_two(E, T).

% search_anytwo(Elem, List)
% looks for any Elem that occurs two times, anywhere
% search_anytwo(a,[b,c,a,a,d,e]). → yes
% search_anytwo(a,[b,c,a,d,e,a,d,e]). → yes
search_anytwo(E, [E|T]) :- search(E, T).
search_anytwo(E, [_|T]) :- search_anytwo(E, T).