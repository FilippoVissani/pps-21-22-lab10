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
% size(List, Size)
% Size will contain the number of elements in List
size([], 0).
size([_|T], N) :- size(T, N2), N is N2 + 1.

% exercise 2.2
% size ( List , Size )
% Size will contain the number of elements in List,
% written using notation zero, s(zero), s(s(zero)) ...
size([], zero).
size([_|T], s(N)) :- size(T, N).

% exercise 2.3
% sum(List, Sum)
% sum([1, 2, 3], X). → yes
sum([], 0).
sum([H|T], N) :- sum(T, N2), N is N2 + H.

% exercise 2.4
% average(List, Average)
% it uses average(List, Count, Sum, Average)
average(L, A) :- average(L, 0, 0, A).
average([], C, S, A) :- A is S / C.
average([H|T], C, S, A) :-
	C2 is C + 1,
	S2 is S + H,
	average(T, C2, S2, A).

% exercise 2.5
% max(List, Max)
% Max is the biggest element in List
% Suppose the list has at least one element
max(N1, N2, N2) :- N2 >= N1.
max([H], H).
max([H|T], M) :- max(T, M2), max(H, M2, M).

% exercise 2.6
% maxMin(List, Max, Min)
% Max is the biggest element in List
% Min is the smallest element in List
% Suppose the list has at least one element
min(N1, N2, N2) :- N1 >= N2.
min(N1, N2, N1) :- N2 >= N1.
maxMin([H], H, H).
maxMin([H|T], Max, Min) :-
	maxMin(T, Max2, Min2),
	max(H, Max2, Max),
	min(H, Min2, Min).
