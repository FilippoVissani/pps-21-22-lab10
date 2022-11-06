% exercise 1.1
% search(Elem, List)
search(E, [E|_]).
search(E, [_|T]) :- search(E, T).

% exercise 1.2
% search2(Elem , List)
% looks for two consecutive occurrences of Elem
search2(E, [E, E|_]).
search2(E, [_|T]) :- search2(E, T).

% exercise 1.3
% search_two(Elem, List)
% looks for two occurrences of Elem with any element in between!
% search_two(a,[b,c,a,a,d,e]). → no
% search_two(a,[b,c,a,d,a,d,e]). → yes
search_two(E, [E, _, E|_]).
search_two(E, [_|T]) :- search_two(E, T).

% exercise 1.4
% search_anytwo(Elem, List)
% looks for any Elem that occurs two times, anywhere
% search_anytwo(a,[b,c,a,a,d,e]). → yes
% search_anytwo(a,[b,c,a,d,e,a,d,e]). → yes
search_anytwo(E, [E|T]) :- search(E, T).
search_anytwo(E, [_|T]) :- search_anytwo(E, T).

% exercise 2.1