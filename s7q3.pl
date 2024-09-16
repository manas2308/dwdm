% Facts: first_name(FullName, FirstName)
first_name(tonyblair, tony).
first_name(georgebush, georgedubya).

% Facts: second_name(FullName, SecondName)
second_name(tonyblair, blair).
second_name(georgebush, bush).

% Rule: Get the full name based on the first and second names
full_name(FirstName, SecondName, FullName) :-
    first_name(FullName, FirstName),
    second_name(FullName, SecondName).

% Rule: Get the first name of a given full name
get_first_name(FullName, FirstName) :-
    first_name(FullName, FirstName).

% Rule: Get the second name of a given full name
get_second_name(FullName, SecondName) :-
    second_name(FullName, SecondName).
