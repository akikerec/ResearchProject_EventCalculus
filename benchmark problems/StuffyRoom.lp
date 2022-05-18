timepoint(0..40).


fluent(blocked1).
fluent(blocked2).
fluent(stuffy).

event(close1).
event(close2).
event(start).



initiates(close1,blocked1,T) :- timepoint(T).

initiates(close2,blocked2,T) :- timepoint(T).

holds_at(blocked2,T) :- holds_at(stuffy,T), timepoint(T).

holds_at(blocked1,T) :- holds_at(stuffy,T), timepoint(T).

holds_at(stuffy,T) :- holds_at(blocked1,T), holds_at(blocked2,T), timepoint(T).

initiates(start,blocked1,T) :- timepoint(T).

terminates(start,blocked2,T) :- timepoint(T).

released_at(stuffy,T) :- timepoint(T).

:- released_at(blocked1,0).

:- released_at(blocked2,0).

:- holds_at(blocked1,0).

:- holds_at(blocked2,0).

happens(start,10).

happens(close2,20).

happens(start, 30).


#show holds_at/2.
#show happens/2.
