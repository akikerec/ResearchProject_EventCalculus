timepoint( 0 .. 10).

fluent(loaded).
fluent(alive).
fluent(walking).
event(load).
event(shoot).

initiates(load,loaded,T) :- timepoint(T).
terminates(shoot,alive,T) :- holds_at(loaded,T), timepoint(T).
terminates(shoot,walking,T) :- terminates(shoot,alive,T), timepoint(T).
 :- {not releasedAt(loaded,0)}0.
 :- {not releasedAt(alive,0)}0.
 :- {not releasedAt(walking,0)}0.
holds_at(alive,0).
holds_at(loaded,0).
holds_at(walking,0).
happens(shoot,5).

#show holds_at/2.
#show happens/2.