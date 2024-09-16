% Define vowels
vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

% Count vowels in a list of characters
count_vowels([], 0).
count_vowels([H|T], Count) :-
    vowel(H),
    count_vowels(T, N),
    Count is N + 1.
count_vowels([_|T], Count) :-
    count_vowels(T, Count).

% Convert a string to a list of characters and count vowels
number_of_vowels(Sentence, Count) :-
    string_chars(Sentence, CharList),
    count_vowels(CharList, Count).

% Example usage
:- number_of_vowels('This is my first Degree in Saveetha School of Engineering', Count),
   write('Number of vowels: '), write(Count), nl.
