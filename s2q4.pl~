female(pam).
female(liz).
female(ann).
female(pat).
male(tom).
male(bob).
male(jim).
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(jim, pat).
mother(X, Y) :-
    female(X),
    parent(X, Y).
father(X, Y) :-
    male(X),
    parent(X, Y).
grandfather(X, Y) :-
    male(X),
    parent(X, Z),
    parent(Z, Y).
grandmother(X, Y) :-
    female(X),
    parent(X, Z),
    parent(Z, Y).
sister(X, Y) :-
    female(X),
    parent(Z, X),
    parent(Z, Y),
    X \= Y.
brother(X, Y) :-
    male(X),
    parent(Z, X),
    parent(Z, Y),
    X \= Y.
%output
% ?- mother(X, bob).
