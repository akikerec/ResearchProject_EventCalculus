timepoint(0..40).
offset(1..1).



fluent(loaded).
fluent(alive).

event(load).
event(shoot).
event(spin).



initiates(load,loaded,T) :- timepoint(T).

terminates(shoot,alive,T) :- holds_at(loaded,T), timepoint(T).

releases(spin,loaded,T) :- timepoint(T).

terminates(shoot,loaded,T) :- timepoint(T).

:- released_at(loaded,0).

:- released_at(alive,0).

holds_at(alive,0).

:- holds_at(loaded,0).

happens(load,10).

happens(spin,20).

happens(shoot,30).

#show holds_at/2.
#show happens/2.
#show happens3/3.
