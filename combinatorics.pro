%% This is a utility file for the crypto problem solver.
%%
%% These functions will take n numbers and find all of 
%%  the ways we can permute them.
%%
%% The functions do this by taking the first set of order 5
%%  and finding all of the permutations of orders 2, 3, and 4
%%  for that particular set.
%%
%% The general formula for the number of permutations is 'n!'
%%  where n is the number of elements in the set.  

%% Permutations of order 2:
%% Given a set with two elements (A,B),
%% find all possibible permutations...
%% namely: (A,B) and (B,A)
permutation(set(A,B), permute(A,B)).
permutation(set(A,B), permute(B,A)).

%% Permutations of order 3:
%% Given a set with three elements (A,B,C),
%% find all possibible permutations...
%% namely: (A,B,C), (A,C,B), (B,A,C), (B,C,A), (C,A,B), and (C,B,A) 
permutation(set(A,B,C), permute(A,X,Y)) :- permutation(set(B,C), permute(X,Y)).
permutation(set(A,B,C), permute(B,X,Y)) :- permutation(set(A,C), permute(X,Y)).
permutation(set(A,B,C), permute(C,X,Y)) :- permutation(Set(A,B), permute(X,Y)).

%% Permutations of order 4:
%% Given a set with 4 elements (A,B,C,D),
%% find all possibible permutations...
%% namely: (A,B,C,D), (A,B,D,C), (A,C,B,D), (A,C,D,B), (A,D,B,C), (A,D,C,B),
%%         (B,A,C,D), (B,A,D,C), (B,C,A,D), (B,C,D,A), (B,D,A,C), (B,D,C,A),
%%         (C,A,B,D), (C,A,D,B), (C,B,A,D), (C,B,D,A), (C,D,A,B), (C,D,B,A),
%%         (D,A,B,C), (D,A,C,B), (D,B,A,C), (D,B,C,A), (D,C,A,B), and (D,C,B,A),
permutation(set(A,B,C,D), permute(A,W,X,Y)) :- permutation(Set(B,C,D), permute(W,X,Y)).
permutation(set(A,B,C,D), permute(B,W,X,Y)) :- permutation(Set(A,C,D), permute(W,X,Y)).
permutation(set(A,B,C,D), permute(C,W,X,Y)) :- permutation(Set(A,B,D), permute(W,X,Y)).
permutation(set(A,B,C,D), permute(D,W,X,Y)) :- permutation(Set(A,B,C), permute(W,X,Y)).

%% Permutations of order 5:
%% Given a set with 5 elements (A,B,C,D,E),
%% find all possibible permutations...
%% namely: (A,B,C,D,E), (A,B,C,E,D), (A,B,D,C,E), (A,B,D,E,C), (A,B,E,C,D), (A,B,E,D,C),
%%         (A,C,B,D,E), (A,C,B,E,D), (A,C,D,B,E), (A,C,D,E,B), (A,C,E,B,D), (A,C,E,D,B),
%%         (A,D,B,C,E), (A,D,B,E,C), (A,D,C,B,E), (A,D,C,E,B), (A,D,E,B,C), (A,D,E,C,B),
%%         (A,E,B,C,D), (A,E,B,D,C), (A,E,C,B,D), (A,E,C,D,B), (A,E,D,B,C), (A,E,D,C,B),
%%-        (B,A,C,D,E), (B,A,C,E,D), (B,A,D,C,E), (B,A,D,E,C), (B,A,E,C,D), (B,A,E,D,C),
%%         (B,C,A,D,E), (B,C,A,E,D), (B,C,D,A,E), (B,C,D,E,A), (B,C,E,A,D), (B,C,E,D,A),
%%         (B,D,A,C,E), (B,D,A,E,C), (B,D,C,A,E), (B,D,C,E,A), (B,D,E,A,C), (B,D,E,C,A),
%%         (B,E,A,C,D), (B,E,A,D,C), (B,E,C,A,D), (B,E,C,D,A), (B,E,D,A,C), (B,E,D,C,A),
%%-        (C,B,A,D,E), (C,B,A,E,D), (C,B,D,A,E), (C,B,D,E,A), (C,B,E,A,D), (C,B,E,D,A),
%%         (C,A,B,D,E), (C,A,B,E,D), (C,A,D,B,E), (C,A,D,E,B), (C,A,E,B,D), (C,A,E,D,B),
%%         (C,D,B,A,E), (C,D,B,E,A), (C,D,A,B,E), (C,D,A,E,B), (C,D,E,B,A), (C,D,E,A,B),
%%         (C,E,B,A,D), (C,E,B,D,A), (C,E,A,B,D), (C,E,A,D,B), (C,E,D,B,A), (C,E,D,A,B),
%%-        (D,B,C,A,E), (D,B,C,E,A), (D,B,A,C,E), (D,B,A,E,C), (D,B,E,C,A), (D,B,E,A,C),
%%         (D,C,B,A,E), (D,C,B,E,A), (D,C,A,B,E), (D,C,A,E,B), (D,C,E,B,A), (D,C,E,A,B),
%%         (D,A,B,C,E), (D,A,B,E,C), (D,A,C,B,E), (D,A,C,E,B), (D,A,E,B,C), (D,A,E,C,B),
%%         (D,E,B,C,A), (D,E,B,A,C), (D,E,C,B,A), (D,E,C,A,B), (D,E,A,B,C), (D,E,A,C,B),
%%-        (E,B,C,D,A), (E,B,C,A,D), (E,B,D,C,A), (E,B,D,A,C), (E,B,A,C,D), (E,B,A,D,C),
%%         (E,C,B,D,A), (E,C,B,A,D), (E,C,D,B,A), (E,C,D,A,B), (E,C,A,B,D), (E,C,A,D,B),
%%         (E,D,B,C,A), (E,D,B,A,C), (E,D,C,B,A), (E,D,C,A,B), (E,D,A,B,C), (E,D,A,C,B),
%%         (E,A,B,C,D), (E,A,B,D,C), (E,A,C,B,D), (E,A,C,D,B), (E,A,D,B,C), and (E,A,D,C,B),
permutation(set(A,B,C,D,E), permute(A,W,X,Y,Z)) :- permutation(Set(B,C,D,E), permute(W,X,Y,Z)).
permutation(set(A,B,C,D,E), permute(B,W,X,Y,Z)) :- permutation(Set(A,C,D,E), permute(W,X,Y,Z)).
permutation(set(A,B,C,D,E), permute(C,W,X,Y,Z)) :- permutation(Set(A,B,D,E), permute(W,X,Y,Z)).
permutation(set(A,B,C,D,E), permute(D,W,X,Y,Z)) :- permutation(Set(A,B,C,E), permute(W,X,Y,Z)).
permutation(set(A,B,C,D,E), permute(E,W,X,Y,Z)) :- permutation(Set(A,B,C,D), permute(W,X,Y,Z)).

combos(set(N1,N2,N3),combo(N1,N2),extras(N3)).
combos(set(N1,N2,N3),combo(N2,N3),extras(N1)).
combos(set(N1,N2,N3),combo(N1,N3),extras(N2)).

combos(set(N1,N2,N3,N4),combo(N1,N2),extras(N3,N4)).
combos(set(N1,N2,N3,N4),combo(N1,N3),extras(N2,N4)).
combos(set(N1,N2,N3,N4),combo(N1,N4),extras(N2,N3)).
combos(set(N1,N2,N3,N4),combo(N2,N3),extras(N1,N4)).
combos(set(N1,N2,N3,N4),combo(N2,N4),extras(N1,N3)).
combos(set(N1,N2,N3,N4),combo(N3,N4),extras(N1,N2)).

combos(set(N1,N2,N3,N4,N5),combo(N1,N2),extras(N3,N4,N5)).
combos(set(N1,N2,N3,N4,N5),combo(N1,N3),extras(N2,N4,N5)).
combos(set(N1,N2,N3,N4,N5),combo(N1,N4),extras(N2,N3,N5)).
combos(set(N1,N2,N3,N4,N5),combo(N1,N5),extras(N2,N3,N4)).
combos(set(N1,N2,N3,N4,N5),combo(N2,N3),extras(N1,N4,N5)).
combos(set(N1,N2,N3,N4,N5),combo(N2,N4),extras(N1,N3,N5)).
combos(set(N1,N2,N3,N4,N5),combo(N2,N5),extras(N1,N3,N4)).
combos(set(N1,N2,N3,N4,N5),combo(N3,N4),extras(N1,N2,N5)).
combos(set(N1,N2,N3,N4,N5),combo(N3,N5),extras(N1,N2,N4)).
combos(set(N1,N2,N3,N4,N5),combo(N4,N5),extras(N1,N2,N3)).
