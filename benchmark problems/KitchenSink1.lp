timepoint(0..40).
height(0..25).
offset(1..25).



fluent(filling).
fluent(height(H)) :- height(H).
fluent(spilling).

event(tapOn).
event(tapOff).
event(overflow).



initiates(tapOn,filling,T) :- timepoint(T).

terminates(tapOff,filling,T) :- timepoint(T).

releases(tapOn,height(H),T) :- timepoint(T), height(H).

initiates(tapOff,height(H),T) :- holds_at(height(H),T), timepoint(T), height(H).

terminates(overflow,filling,T) :- timepoint(T).

initiates(overflow,height(H),T) :- holds_at(height(H),T), timepoint(T), height(H).

initiates(overflow,spilling,T):- timepoint(T).

trajectory(filling,T,height(H2),Off) :- holds_at(height(H1),T), H2==H1+Off, timepoint(T), height(H1), height(H2), offset(Off).

:- holds_at(height(H1),T), holds_at(height(H2),T), H1!=H2, timepoint(T), height(H1), height(H2).

happens(overflow,T) :- holds_at(height(25),T), holds_at(filling,T), timepoint(T).

holds_at(height(0),0).

:- holds_at(filling,0).

:- holds_at(spilling,0).

happens(tapOn,10).

:- released_at(filling,0).

:- released_at(height(H),0).

:- released_at(spilling,0).


#show holds_at/2.