% Initial facts
at(monkey, floor).
at(bananas, ceiling).
at(chair, floor).
at(stick, floor).
has(monkey, nothing).
reachable(monkey, no).

% Actions

% Move the monkey to a specific location (chair or stick)
move(monkey, X, Y) :-
    at(monkey, X),
    at(Y, floor),
    retract(at(monkey, X)),
    assert(at(monkey, Y)),
    write('Monkey moves to '), write(Y), nl.

% Carry an object (chair or stick)
carry(monkey, Object) :-
    at(monkey, Object),
    has(monkey, nothing),
    retract(has(monkey, nothing)),
    assert(has(monkey, Object)),
    retract(at(Object, floor)),
    write('Monkey carries the '), write(Object), nl.

% Place the object down
place(monkey, Object) :-
    has(monkey, Object),
    retract(has(monkey, Object)),
    assert(has(monkey, nothing)),
    assert(at(Object, floor)),
    write('Monkey places the '), write(Object), nl.

% Climb onto the chair
climb(monkey, chair) :-
    at(monkey, chair),
    retract(at(monkey, chair)),
    assert(at(monkey, ceiling)),
    assert(reachable(monkey, yes)),
    write('Monkey climbs onto the chair'), nl.

% Pick up the stick and wave it to knock down the bananas
use_stick(monkey, stick) :-
    has(monkey, stick),
    at(monkey, ceiling),
    reachable(monkey, yes),
    retract(at(bananas, ceiling)),
    assert(at(bananas, floor)),
    write('Monkey uses the stick to knock down the bananas'), nl.

% Main procedure to get bananas
get_bananas :-
    move(monkey, floor, stick),     % Move to the stick
    carry(monkey, stick),           % Carry the stick
    move(monkey, stick, chair),     % Move to the chair
    place(monkey, stick),           % Place the stick near the chair
    climb(monkey, chair),           % Climb onto the chair
    use_stick(monkey, stick),       % Use the stick to knock down the bananas
    write('Monkey retrieves the bananas!'), nl.

%output
%!  ?- get_bananas.
