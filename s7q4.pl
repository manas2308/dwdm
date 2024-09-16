% Facts about gender
female(sarah).
female(rebekah).
female(hagar_concubine).
female(milcah).
female(bashemath).
female(mahalath).
female(first_daughter).
female(rachel).
female(labans_wife).

male(terah).
male(abraham).
male(nahor).
male(haran).
male(isaac).
male(ismael).
male(uz).
male(kemuel).

% Facts about parent-child relationships
parent(abraham, isaac).
parent(abraham, ishmael).
parent(sarah, isaac).
parent(hagar_concubine, ishmael).
parent(nahor, milcah).
parent(nahor, bashemath).
parent(nahor, mahalath).
parent(labans_wife, first_daughter).
parent(labans_wife, rachel).
parent(terah, abraham).
parent(terah, nahor).
parent(terah, haran).

% Rule: Define if X is a parent of Y
parent_of(X, Y) :-
    parent(X, Y).

% Rule: Define if X is a child of Y
child_of(Y, X) :-
    parent(X, Y).

% Rule: Define if two individuals are siblings
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Rule: Define if X is the mother of Y
mother(X, Y) :-
    female(X),
    parent(X, Y).

% Rule: Define if X is the father of Y
father(X, Y) :-
    male(X),
    parent(X, Y).
%output ?- father(Father, Child).
