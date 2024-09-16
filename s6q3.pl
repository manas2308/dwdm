% Facts
rainy(chennai).
rainy(coimbatore).
rainy(ooty).
cold(ooty).

% Rule: A place is considered cold and rainy if it is both rainy and cold
cold_and_rainy(Place) :-
    rainy(Place),
    cold(Place).

% Forward chaining: Print all places that are cold and rainy
print_cold_and_rainy :-
    cold_and_rainy(Place),
    write(Place), nl,
    fail.  % Ensures that all results are printed.

print_cold_and_rainy.  % To actually execute the print statement
