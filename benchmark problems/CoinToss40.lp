timepoint(0..50).



fluent(itsHeads).
fluent(heads).

event(toss).



initiates(toss,heads,T) :- holds_at(itsHeads,T), timepoint(T).

terminates(toss,heads,T) :- not holds_at(itsHeads,T), timepoint(T).

released_at(itsHeads,T) :- timepoint(T).

:- released_at(heads,0).

holds_at(heads,0).

happens(toss,10).

happens(toss,20).

happens(toss,30).

holds_at(itsHeads,0).

holds_at(itsHeads,20).

#show happens/2.
#show holds_at/2.