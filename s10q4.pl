% Facts about being a man
man(socrates).
man(einstein).
man(alexander).

% Rule: All men are mortal
mortal(Person) :-
    man(Person).

% Example queries
% To check if Socrates is mortal:
% ?- mortal(socrates).
% To check if Einstein is mortal:
% ?- mortal(einstein).
% To check if Alexander is mortal:
% ?- mortal(alexander).
