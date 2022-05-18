timepoint(0..40).
offset(1..1).



fluent(hasTicket).
fluent(onRed).
fluent(onYellow).

event(buy).
event(board).
event(boardRed).
event(boardYellow).



%%if board happens, then either the red bus was boarded or the yellow bus was boarded (nondeterministic effect)
happens(boardRed,Time) ; happens(boardYellow,Time) :- happens(board,Time), timepoint(Time).

initiates(buy,hasTicket,Time) :- timepoint(Time).

initiates(boardRed,onRed,Time) :- holds_at(hasTicket,Time), timepoint(Time).
initiates(boardYellow,onYellow,Time) :- holds_at(hasTicket,Time), timepoint(Time).

:- holds_at(onRed,Time), holds_at(onYellow,Time), timepoint(Time).

:- holds_at(onYellow,Time), holds_at(onRed,Time), timepoint(Time).

holds_at(hasTicket,Time) :- holds_at(onRed,Time), timepoint(Time).

holds_at(hasTicket,Time) :- holds_at(onYellow,Time), timepoint(Time).

:- released_at(hasTicket,0).

:- released_at(onRed,0).

:- released_at(onYellow,0).


:- holds_at(hasTicket,0).


happens(buy,24).

happens(board,35).


#show holds_at/2.
#show happens/2.