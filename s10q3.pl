happy(X) :- passing_history(X), winning_lottery(X).
passing_history(X) :- studies(X); lucky(X).
studies(john) :- false.
lucky(john).
winning_lottery(X) :- lucky(X).
prove_john_happy :-
    \+ happy(john),
    write('Proof by contradiction: John is not happy'), nl,
    fail.
resolution_refutation :-
    prove_john_happy,
    !,
    write('John is happy!'), nl.
