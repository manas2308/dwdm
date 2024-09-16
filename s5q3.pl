% Facts: dog(Name), cat(Name)
dog(fido).
dog(rover).
dog(jane).
dog(tom).
dog(fred).
dog(henry).
cat(mary).
cat(harry).
cat(bill).
cat(steve).

% Size facts for both dogs and cats
small(henry).
medium(harry).  % Harry is a medium-sized cat.
medium(fred).   % Fred is a medium-sized dog.
large(fido).    % Fido is a large dog.
large(mary).    % Mary is a large cat.
large(tom).     % Tom is a large dog.
large(fred).    % Fred is also large in some contexts.
large(steve).   % Steve is a large cat.
large(jim).     % Jim is large (although not defined as dog or cat).
large(mike).    % Mike is large (although not defined as dog or cat).

% Rules

% Check if a dog is small, medium, or large
small_dog(Dog) :-
    dog(Dog),
    small(Dog).

medium_dog(Dog) :-
    dog(Dog),
    medium(Dog).

large_dog(Dog) :-
    dog(Dog),
    large(Dog).

% Check if a cat is small, medium, or large
small_cat(Cat) :-
    cat(Cat),
    small(Cat).

medium_cat(Cat) :-
    cat(Cat),
    medium(Cat).

large_cat(Cat) :-
    cat(Cat),
    large(Cat).
