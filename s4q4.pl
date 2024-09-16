% Facts: person(FirstName, Surname, Sex, Age, Occupation)
person(frances, wilson, female, 28, architect).
person(fred, jones, male, 62, doctor).
person(paul, smith, male, 45, plumber).
person(martin, williams, male, 23, chemist).
person(mary, jones, female, 24, programmer).
person(martin, johnson, male, 47, solicitor).

% Rule: Identify a man
man(FirstName) :-
    person(FirstName, _, male, _, _).

% Rule: Identify a woman
woman(FirstName) :-
    person(FirstName, _, female, _, _).

% Rule: Find a person’s occupation by their first name
occupation(FirstName, Occupation) :-
    person(FirstName, _, _, _, Occupation).

% Rule: Find a person’s age by their first name
age(FirstName, Age) :-
    person(FirstName, _, _, Age, _).
%output
%?- woman(Name).
