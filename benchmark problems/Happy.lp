timepoint(0..20).

person(fred).

fluent(happy(X)) :- person(X).
fluent(hungry(X)) :- person(X).
fluent(cold(X)) :- person(X).

event(feed(X)) :- person(X).
event(clothe(X)) :- person(X).

holds_at(happy(X), T) :- not holds_at(hungry(X), T), not holds_at(cold(X),T), person(X), timepoint(T).

terminates(feed(X), hungry(X), T) :- timepoint(T), person(X).
terminates(clothe(X), cold(X), T) :- timepoint(T), person(X).

holds_at(hungry(fred),0).
holds_at(cold(fred),0).

happens(feed(fred),10).

#show holds_at/2.
#show happens/2.
