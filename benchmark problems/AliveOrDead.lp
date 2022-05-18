timepoint(0..25).

fluent(alive).
fluent(loaded).
fluent(dead).

event(load).
event(sneeze).
event(shoot).

initiates(load,loaded,T) :- timepoint(T).

terminates(shoot,alive,T) :- holds_at(loaded,T), timepoint(T).

happens(load,10).
happens(sneeze,15).
happens(shoot,20).

holds_at(alive,0).

#show happens/2.
#show holds_at/2.