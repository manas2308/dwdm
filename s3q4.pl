% Facts
american(robert).           % Robert is an American.
hostile(countryA).           % Country A is hostile.
owns(countryA, missiles).    % Country A owns missiles.
sold(robert, missiles, countryA).  % Robert sold the missiles to Country A.

% Rules
% It is a crime for an American to sell weapons to a hostile nation
criminal(X) :-
    american(X),
    sold(X, Weapon, Y),
    owns(Y, Weapon),
    hostile(Y),
    write(X), write(' is a criminal.'), nl.

% Forward chaining (in Prolog this happens by triggering a query to test the rule)
prove_crime :-
    criminal(robert).
%output query
%?- prove_crime.
