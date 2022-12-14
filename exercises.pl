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

% exercise 3.1
% same(List1, List2)
% are the two lists exactly the same?
same([], []).
same([H|T], [H|T2]) :- same(T, T2).

% exercise 3.2
% all_bigger(List1, List2)
% all elements in List1 are bigger than those in List2, 1 by 1
% example: all_bigger([10, 20, 30, 40], [9, 19, 29, 39]).
all_bigger([H1], [H2]) :- H1 > H2.
all_bigger([H1|T1], [H2|T2]) :- H1 > H2, all_bigger(T1, T2).

% exercise 3.3
% sublist(List1, List2)
% List1 should contain elements all also in List2
% example: sublist([1, 2], [5, 3, 2, 1]).
sublist([], L).
sublist([H|T], L) :- search(H, L), sublist(T, L).

% exercise 4.1
% seq(N, List)
% example: seq(5, [0, 0, 0, 0, 0]).
seq(0,[]).
seq(N, [0|T]) :- N2 is N - 1, seq(N2, T).

% exercise 4.2
% seqR(N, List)
% example: seqR(4, [4, 3, 2, 1, 0]).
seqR(0, []).
seqR(N, [N|T]) :- N2 is N - 1, seqR(N2, T).

% exercise 4.3
% seqR2(N, List)
% example: seqR2(4, [0, 1, 2, 3, 4]).
last([], E, [E]).
last([H|T], E, [H|T2]) :- last(T, E, T2).

seqR2(0, [0]).
seqR2(N, L) :- N2 is N - 1, seqR2(N2, L2), last(L2, N, L).