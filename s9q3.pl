interpret(true) :- !.
interpret((GoalA, GoalB)) :- !, interpret(GoalA), interpret(GoalB).

goal1 :- write('Goal 1 is true'), nl.
goal2 :- write('Goal 2 is true'), nl.

test_inference :- interpret((goal1, goal2)).
